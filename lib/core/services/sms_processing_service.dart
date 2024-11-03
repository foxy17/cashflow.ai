import 'package:another_telephony/telephony.dart';
import 'package:fpdart/fpdart.dart';
import 'package:cashflow_ai/core/services/database_service.dart';
import 'package:cashflow_ai/core/services/ai/ai_service.dart';
import 'package:cashflow_ai/core/constants/structured_response_schema.dart';
import 'package:cashflow_ai/core/constants/currency_keywords.dart';
import 'package:cashflow_ai/core/models/models.dart';

class SmsProcessingService {
  final Telephony telephony;
  final DatabaseService databaseService;
  final AIService aiService;

  SmsProcessingService({
    required this.telephony,
    required this.databaseService,
    required this.aiService,
  });

  Future<List<Spending>> processSmsMessages() async {
    final spendingsResult = await _fetchAndProcessSms().run();
    spendingsResult.fold(
      (failure) => print('Error processing SMS: $failure'),
      (spendings) => print('SMS processing completed successfully: $spendings'),
    );
    return spendingsResult.getOrElse((error) => <Spending>[]);
  }

  TaskEither<String, List<Spending>> _fetchAndProcessSms() {
    return TaskEither.tryCatch(
      () async {
        // Build filter dynamically from all financial keywords
        var filter = SmsFilter.where(SmsColumn.BODY).like(allFinancialKeywords.first);

        // Add remaining keywords with OR conditions
        for (var i = 1; i < allFinancialKeywords.length; i++) {
          filter = filter.or(SmsColumn.BODY).like('%${allFinancialKeywords[i]}%');
        }

        // Query SMS messages using Telephony's query builder
        final List<SmsMessage> allMessages = await telephony.getInboxSms(
          columns: [
            SmsColumn.ID,
            SmsColumn.ADDRESS,
            SmsColumn.BODY,
            SmsColumn.DATE,
          ],
          filter: filter,
          sortOrder: [OrderBy(SmsColumn.DATE, sort: Sort.DESC)],
        );

        // Fetch processed SMS IDs
        List<ProcessedSms> processedSmsList = await databaseService.getAllProcessedSms();

        // Fetch existing spendings
        List<Spending> existingSpendings = await databaseService.getAllSpendings();

        // Filter out already processed SMS
        List<SmsMessage> newMessages = processedSmsList.isNotEmpty
            ? allMessages.where((msg) => !processedSmsList.any((processed) => processed.smsId == msg.id.toString())).toList()
            : allMessages;

        // Further filter if spendings exist
        if (existingSpendings.isNotEmpty) {
          newMessages = newMessages.where((msg) {
            return !existingSpendings.any((spending) =>
                spending.vendor == msg.address &&
                spending.date.isAtSameMomentAs(DateTime.fromMillisecondsSinceEpoch(msg.date!)));
          }).toList();
        }
        

        // List to hold spendings
        List<Spending> spendingsList = [];

        // Send to AI service and store results
        for (var msg in newMessages) {
          final structuredData = await aiService.generateStructuredResponse(
            content: msg.body!,
            systemMessage: 'You are a financial transaction analyzer. Extract transaction details from the given messages.',
            schema: structuredResponseSchema,
            schemaName: 'TransactionAnalysis',
            schemaDescription: 'Analyzes multiple bank transaction messages to extract structured data',
            additionalOptions: {
              'temperature': 0,
            },
          );

          // Convert structured data to Spending objects
          List<Spending> spendings = (structuredData['transactions'] as List)
              .map((e) => Spending.fromMap({
                    ...e as Map<String, dynamic>,
                    'address': msg.address ?? 'Unknown',
                    'date': DateTime.fromMillisecondsSinceEpoch(msg.date!).toIso8601String(),
                  }))
              .toList();

          // Store spendings
          for (var spending in spendings) {
            await databaseService.addSpending(spending);
            spendingsList.add(spending); // Add to the list
          }

          // Mark SMS as processed
          final processedSms = ProcessedSms(
            smsId: msg.id.toString(),
            date: DateTime.fromMillisecondsSinceEpoch(msg.date!),
          );
          await databaseService.addProcessedSms(processedSms);
        }

        return spendingsList; // Return the list of spendings
      },
      (error, stackTrace) => error.toString(),
    );
  }
} 