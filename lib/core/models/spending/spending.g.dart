// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpendingImpl _$$SpendingImplFromJson(Map<String, dynamic> json) =>
    _$SpendingImpl(
      id: (json['id'] as num?)?.toInt(),
      date: DateTime.parse(json['date'] as String),
      category: json['category'] as String,
      type: $enumDecode(_$PaymentTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      vendor: json['vendor'] as String,
      address: json['address'] as String,
      paidForAnother: json['paidForAnother'] as bool?,
      paidBack: json['paidBack'] as bool?,
    );

Map<String, dynamic> _$$SpendingImplToJson(_$SpendingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'category': instance.category,
      'type': _$PaymentTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'vendor': instance.vendor,
      'address': instance.address,
      'paidForAnother': instance.paidForAnother,
      'paidBack': instance.paidBack,
    };

const _$PaymentTypeEnumMap = {
  PaymentType.upi: 'upi',
  PaymentType.creditCard: 'credit_card',
  PaymentType.debitCard: 'debit_card',
};
