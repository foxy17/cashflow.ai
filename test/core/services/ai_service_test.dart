import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:cashflow_ai/core/services/ai/ai_service.dart';
import 'package:cashflow_ai/core/services/ai/ai_service_type.dart';
import 'package:cashflow_ai/core/services/ai/openai_service.dart';

@GenerateNiceMocks([MockSpec<OpenAIService>()])
import 'ai_service_test.mocks.dart';

void main() {
  late AIService aiService;
  late MockOpenAIService mockOpenAIService;

  setUp(() {
    mockOpenAIService = MockOpenAIService();
    aiService = AIService(
      openAIService: mockOpenAIService,
      defaultService: AIServiceType.openAI,
    );
  });

  group('AIService Tests', () {
    test('should use default service (OpenAI) when initialized', () async {
      final testResponse = {'test': 'response'};
      
      when(mockOpenAIService.generateStructuredResponse(
        content: 'test content',
        systemMessage: 'test message',
        schema: {'test': 'schema'},
        schemaName: 'TestSchema',
        schemaDescription: 'Test Description',
        additionalOptions: {'temperature': 0},
      )).thenAnswer((_) async => testResponse);

      final result = await aiService.generateStructuredResponse(
        content: 'test content',
        systemMessage: 'test message',
        schema: {'test': 'schema'},
        schemaName: 'TestSchema',
        schemaDescription: 'Test Description',
        additionalOptions: {'temperature': 0},
      );

      expect(result, equals(testResponse));
    });

    test('should throw error when trying to use unimplemented service', () {
      expect(
        () => aiService.setAIService(AIServiceType.openAI),
        returnsNormally,
      );

      // Add a new enum value without implementing the service
      expect(
        () => aiService.setAIService(AIServiceType.values.last),
        throwsStateError,
      );
    });

    test('should pass model parameter correctly when provided', () async {
      final testResponse = {'test': 'response'};
      const testModel = 'gpt4';
      
      when(mockOpenAIService.generateStructuredResponse(
        content: any,
        systemMessage: any,
        schema: any,
        model: testModel,
        schemaName: any,
        schemaDescription: any,
        additionalOptions: any,
      )).thenAnswer((_) async => testResponse);

      final result = await aiService.generateStructuredResponse(
        content: 'test content',
        systemMessage: 'test message',
        schema: {'test': 'schema'},
        model: testModel,
        schemaName: 'TestSchema',
        schemaDescription: 'Test Description',
      );

      expect(result, equals(testResponse));
      
      verify(mockOpenAIService.generateStructuredResponse(
        content: any,
        systemMessage: any,
        schema: any,
        model: testModel,
        schemaName: any,
        schemaDescription: any,
        additionalOptions: any,
      )).called(1);
    });
  });
} 