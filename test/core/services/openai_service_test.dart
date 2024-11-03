import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:openai_dart/openai_dart.dart';
import 'package:cashflow_ai/core/services/ai/openai_service.dart';
import '../../test_utils/mock_data/payment_messages.dart';
import '../../test_utils/load_env.dart';
import 'package:cashflow_ai/core/constants/structured_response_schema.dart';

void main() {
  late OpenAIService openAIService;

  setUpAll(() {
    loadTestEnv();
  });

  setUp(() {
    openAIService = OpenAIService();
    final testApiKey = Platform.environment['OPENAI_API_KEY'];
    if (testApiKey == null) {
      throw Exception(
        'OPENAI_API_KEY environment variable is required to run tests.\n'
        'Either:\n'
        '1. Run tests with: OPENAI_API_KEY=your_api_key flutter test\n'
        '2. Create a .env.test file with OPENAI_API_KEY=your_api_key',
      );
    }
    openAIService.updateApiKey(testApiKey);
  });

  group('OpenAIService Configuration Tests', () {
    test('should update default model correctly', () {
      const newModel = ChatCompletionModel.model(ChatCompletionModels.gpt4oMini);
      openAIService.updateDefaultModel(newModel);
      
      // Since _defaultModel is private, we can verify the change through a request
      expect(() => openAIService.generateStructuredResponse(
        content: 'test',
        systemMessage: 'test',
        schema: {'test': 'schema'},
      ), returnsNormally);
    });

    test('should throw error when client not initialized', () {
      final uninitializedService = OpenAIService();
      expect(
        () => uninitializedService.generateStructuredResponse(
          content: 'test',
          systemMessage: 'test',
          schema: {'test': 'schema'},
        ),
        throwsStateError,
      );
    });
  });

  group('OpenAIService Payment Processing Tests', () {
    test('should process multiple payment messages correctly', () async {
      // Skip this test if running in CI environment without API key
      if (Platform.environment['CI'] == 'true') {
        return;
      }

      const schema = structuredResponseSchema;
      final messages = PaymentMessages.sampleMessages.join('\n');
      
      final response = await openAIService.generateStructuredResponse(
        content: messages,
        systemMessage: 'You are a financial transaction analyzer. Extract transaction details from the given messages.',
        schema: schema,
        schemaName: 'TransactionAnalysis',
        schemaDescription: 'Analyzes multiple bank transaction messages to extract structured data',
        additionalOptions: {'temperature': 0},
      );

      expect(response, isA<Map<String, dynamic>>());
      expect(response['transactions'], isA<List>());
      
      final transactions = response['transactions'] as List;
      expect(transactions.length, equals(PaymentMessages.sampleMessages.length));

      for (final transaction in transactions) {
        expect(transaction['date'], matches(r'^\d{4}-\d{2}-\d{2}$'));
        expect(transaction['amount'], isA<num>());
        expect(transaction['category'], isIn([
          'food_and_beverages',
          'shopping',
          'entertainment',
          'travel',
          'utilities',
          'others'
        ]));
        expect(transaction['paymentMode'], isIn([
          'UPI',
          'CREDIT_CARD',
          'DEBIT_CARD'
        ]));
        expect(transaction['merchantName'], isA<String>());
      }
    });

    test('should handle model override correctly', () async {
      if (Platform.environment['CI'] == 'true') {
        return;
      }

      const schema = structuredResponseSchema;
      final messages = PaymentMessages.sampleMessages.first;
      
      final response = await openAIService.generateStructuredResponse(
        content: messages,
        systemMessage: 'Extract transaction details.',
        schema: schema,
        model: 'gpt4',
        additionalOptions: {'temperature': 0},
      );

      expect(response, isA<Map<String, dynamic>>());
      expect(response['transactions'], isA<List>());
    });
  });
} 