// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processed_sms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessedSmsImpl _$$ProcessedSmsImplFromJson(Map<String, dynamic> json) =>
    _$ProcessedSmsImpl(
      smsId: json['smsId'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$ProcessedSmsImplToJson(_$ProcessedSmsImpl instance) =>
    <String, dynamic>{
      'smsId': instance.smsId,
      'date': instance.date.toIso8601String(),
    };
