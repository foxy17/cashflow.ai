import 'package:freezed_annotation/freezed_annotation.dart';

part 'processed_sms.freezed.dart';
part 'processed_sms.g.dart';

@freezed
class ProcessedSms with _$ProcessedSms {
  const factory ProcessedSms({
    required String smsId,
    required DateTime date,
  }) = _ProcessedSms;

  factory ProcessedSms.fromJson(Map<String, dynamic> json) =>
      _$ProcessedSmsFromJson(json);

  // Custom fromMap factory for Sembast
  factory ProcessedSms.fromMap(Map<String, dynamic> map) {
    return ProcessedSms(
      smsId: map['smsId'] as String,
      date: DateTime.parse(map['date'] as String),
    );
  }
}

// Extension for Sembast compatibility
extension ProcessedSmsX on ProcessedSms {
  // Convert to Map for Sembast storage
  Map<String, dynamic> toMap() {
    return {
      'smsId': smsId,
      'date': date.toIso8601String(),
    };
  }
} 