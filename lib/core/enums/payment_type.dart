import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum PaymentType {
  @JsonValue('upi')
  upi,
  
  @JsonValue('credit_card')
  creditCard,
  
  @JsonValue('debit_card')
  debitCard,
} 