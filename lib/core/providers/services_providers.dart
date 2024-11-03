import 'package:cashflow_ai/core/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:another_telephony/telephony.dart';


final smsProcessingServiceProvider = Provider<SmsProcessingService>((ref) {
  final telephony = Telephony.instance;
  final databaseService = DatabaseService.instance;
  final aiService = ref.watch(aiServiceProvider);

  return SmsProcessingService(
    telephony: telephony,
    databaseService: databaseService,
    aiService: aiService,
  );
}); 