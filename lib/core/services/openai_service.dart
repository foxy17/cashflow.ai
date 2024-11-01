import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openai_dart/openai_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'openai_service.g.dart';

/// Service wrapper for OpenAI client that handles structured output generation
class OpenAIService {
  OpenAIClient? _client;
  String? _currentApiKey;
  ChatCompletionModel _defaultModel = const ChatCompletionModel.model(
    ChatCompletionModels.gpt4oMini,
  );

  /// Updates the API key and recreates the client if necessary
  void updateApiKey(String apiKey) {
    if (_currentApiKey != apiKey) {
      _currentApiKey = apiKey;
      _client = OpenAIClient(apiKey: apiKey);
    }
  }

  /// Updates the default model to be used for completions
  void updateDefaultModel(ChatCompletionModel model) {
    _defaultModel = model;
  }

  /// Ensures client is initialized before use
  OpenAIClient get client {
    if (_client == null) {
      throw StateError('OpenAI client not initialized. Call updateApiKey first.');
    }
    return _client!;
  }

  /// Generates a structured response based on the provided schema
  /// 
  /// [userMessage], [systemMessage], and [schema] are required positional parameters
  /// Other parameters are optional named parameters
  Future<Map<String, dynamic>> generateStructuredResponse(
    String userMessage,
    String systemMessage,
    Map<String, dynamic> schema,
    {
      String? schemaName,
      String? schemaDescription,
      ChatCompletionModel? model,
      double temperature = 0,
    }
  ) async {
    final response = await client.createChatCompletion(
      request: CreateChatCompletionRequest(
        model: model ?? _defaultModel,
        messages: [
          ChatCompletionMessage.system(
            content: systemMessage,
          ),
          ChatCompletionMessage.user(
            content: ChatCompletionUserMessageContent.string(userMessage),
          ),
        ],
        temperature: temperature,
        responseFormat: ResponseFormat.jsonSchema(
          jsonSchema: JsonSchemaObject(
            name: schemaName ?? 'StructuredResponse',
            description: schemaDescription ?? 'A structured response based on the provided schema',
            strict: true,
            schema: schema,
          ),
        ),
      ),
    );

    final jsonString = response.choices.first.message.content;
    if (jsonString == null) {
      throw StateError('No content in response');
    }
    
    return json.decode(jsonString) as Map<String, dynamic>;
  }
}

@riverpod
OpenAIService openAIService(Ref ref) {
  return OpenAIService();
} 