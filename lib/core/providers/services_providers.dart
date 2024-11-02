import 'package:cashflow_ai/core/services/database_service.dart';
import 'package:cashflow_ai/core/services/ai/openai_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cashflow_ai/core/services/sms_processing_service.dart';
import 'package:another_telephony/telephony.dart';


final smsProcessingServiceProvider = Provider<SmsProcessingService>((ref) {
  final telephony = Telephony.instance;
  final databaseService = DatabaseService.instance;
  final openAIService = ref.watch(openAIServiceProvider);

  return SmsProcessingService(
    telephony: telephony,
    databaseService: databaseService,
    openAIService: openAIService,
  );
}); 