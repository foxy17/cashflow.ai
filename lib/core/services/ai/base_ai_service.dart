abstract class BaseAIService {
  Future<Map<String, dynamic>> generateStructuredResponse({
    required String content,
    required String systemMessage,
    required Map<String, dynamic> schema,
    String? model,
    String? schemaName,
    String? schemaDescription,
    Map<String, dynamic>? additionalOptions,
  });
} 