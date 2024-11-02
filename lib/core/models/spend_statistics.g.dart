// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spend_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpendStatisticsImpl _$$SpendStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$SpendStatisticsImpl(
      id: (json['id'] as num?)?.toInt(),
      month: DateTime.parse(json['month'] as String),
      totalSpent: (json['totalSpent'] as num).toDouble(),
      percentDifference: (json['percentDifference'] as num).toDouble(),
      mostSpentCategory: json['mostSpentCategory'] as String,
      mostUsedPaymentMode: json['mostUsedPaymentMode'] as String,
      categoryBreakdown:
          (json['categoryBreakdown'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      paymentModeBreakdown:
          (json['paymentModeBreakdown'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$SpendStatisticsImplToJson(
        _$SpendStatisticsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'month': instance.month.toIso8601String(),
      'totalSpent': instance.totalSpent,
      'percentDifference': instance.percentDifference,
      'mostSpentCategory': instance.mostSpentCategory,
      'mostUsedPaymentMode': instance.mostUsedPaymentMode,
      'categoryBreakdown': instance.categoryBreakdown,
      'paymentModeBreakdown': instance.paymentModeBreakdown,
    };
