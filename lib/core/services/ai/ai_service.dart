import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'ai_service_type.dart';
import 'base_ai_service.dart';
import 'openai_service.dart';

part 'ai_service.g.dart';

class AIService {
  final Map<AIServiceType, BaseAIService> _services;
  AIServiceType _currentService;

  AIService({
    required OpenAIService openAIService,
    AIServiceType defaultService = AIServiceType.openAI,
  }) : _services = {
          AIServiceType.openAI: openAIService,
        },
        _currentService = defaultService;

  void setAIService(AIServiceType serviceType) {
    if (!_services.containsKey(serviceType)) {
      throw StateError('AI service type $serviceType not implemented');
    }
    _currentService = serviceType;
  }

  Future<Map<String, dynamic>> generateStructuredResponse({
    required String content,
    required String systemMessage,
    required Map<String, dynamic> schema,
    String? model,
    String? schemaName,
    String? schemaDescription,
    Map<String, dynamic>? additionalOptions,
  }) async {
    final service = _services[_currentService];
    if (service == null) {
      throw StateError('No AI service configured');
    }

    return service.generateStructuredResponse(
      content: content,
      systemMessage: systemMessage,
      schema: schema,
      model: model,
      schemaName: schemaName,
      schemaDescription: schemaDescription,
      additionalOptions: additionalOptions,
    );
  }
}

@riverpod
AIService aiService(Ref ref) {
  final openAIService = ref.watch(openAIServiceProvider);
  return AIService(openAIService: openAIService);
} 