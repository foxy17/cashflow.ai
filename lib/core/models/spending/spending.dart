import 'package:freezed_annotation/freezed_annotation.dart';
import '../../enums/payment_type.dart';

part 'spending.freezed.dart';
part 'spending.g.dart';

@freezed
class Spending with _$Spending {
  const factory Spending({
    int? id,
    required DateTime date,
    required String category,
    required PaymentType type,
    required double amount,
    required String vendor,
    required String address,
    bool? paidForAnother,
    bool? paidBack,
  }) = _Spending;

  factory Spending.fromJson(Map<String, dynamic> json) =>
      _$SpendingFromJson(json);

  // Custom fromMap factory for Sembast
  factory Spending.fromMap(Map<String, dynamic> map) {
    return Spending.fromJson({
      'id': map['id'] as int?,
      'date': map['date'] as String,
      'category': map['category'] as String,
      'type': map['type'] as String,
      'amount': map['amount'] as double,
      'vendor': map['vendor'] as String,
      'address': map['address'] as String,
      'paidForAnother': map['paidForAnother'] as bool?,
      'paidBack': map['paidBack'] as bool?,
    });
  }
}

// Extension for Sembast compatibility
extension SpendingX on Spending {
  // Convert to Map for Sembast storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'category': category,
      'type': type.name,
      'amount': amount,
      'vendor': vendor,
      'address': address,
      'paidForAnother': paidForAnother,
      'paidBack': paidBack,
    };
  }
}
