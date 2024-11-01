// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spending.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Spending _$SpendingFromJson(Map<String, dynamic> json) {
  return _Spending.fromJson(json);
}

/// @nodoc
mixin _$Spending {
  int? get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  PaymentType get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get vendor => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool? get paidForAnother => throw _privateConstructorUsedError;
  bool? get paidBack => throw _privateConstructorUsedError;

  /// Serializes this Spending to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Spending
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpendingCopyWith<Spending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingCopyWith<$Res> {
  factory $SpendingCopyWith(Spending value, $Res Function(Spending) then) =
      _$SpendingCopyWithImpl<$Res, Spending>;
  @useResult
  $Res call(
      {int? id,
      DateTime date,
      String category,
      PaymentType type,
      double amount,
      String vendor,
      String address,
      bool? paidForAnother,
      bool? paidBack});
}

/// @nodoc
class _$SpendingCopyWithImpl<$Res, $Val extends Spending>
    implements $SpendingCopyWith<$Res> {
  _$SpendingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Spending
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? category = null,
    Object? type = null,
    Object? amount = null,
    Object? vendor = null,
    Object? address = null,
    Object? paidForAnother = freezed,
    Object? paidBack = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      paidForAnother: freezed == paidForAnother
          ? _value.paidForAnother
          : paidForAnother // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidBack: freezed == paidBack
          ? _value.paidBack
          : paidBack // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpendingImplCopyWith<$Res>
    implements $SpendingCopyWith<$Res> {
  factory _$$SpendingImplCopyWith(
          _$SpendingImpl value, $Res Function(_$SpendingImpl) then) =
      __$$SpendingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      DateTime date,
      String category,
      PaymentType type,
      double amount,
      String vendor,
      String address,
      bool? paidForAnother,
      bool? paidBack});
}

/// @nodoc
class __$$SpendingImplCopyWithImpl<$Res>
    extends _$SpendingCopyWithImpl<$Res, _$SpendingImpl>
    implements _$$SpendingImplCopyWith<$Res> {
  __$$SpendingImplCopyWithImpl(
      _$SpendingImpl _value, $Res Function(_$SpendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Spending
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? category = null,
    Object? type = null,
    Object? amount = null,
    Object? vendor = null,
    Object? address = null,
    Object? paidForAnother = freezed,
    Object? paidBack = freezed,
  }) {
    return _then(_$SpendingImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      paidForAnother: freezed == paidForAnother
          ? _value.paidForAnother
          : paidForAnother // ignore: cast_nullable_to_non_nullable
              as bool?,
      paidBack: freezed == paidBack
          ? _value.paidBack
          : paidBack // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpendingImpl implements _Spending {
  const _$SpendingImpl(
      {this.id,
      required this.date,
      required this.category,
      required this.type,
      required this.amount,
      required this.vendor,
      required this.address,
      this.paidForAnother,
      this.paidBack});

  factory _$SpendingImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpendingImplFromJson(json);

  @override
  final int? id;
  @override
  final DateTime date;
  @override
  final String category;
  @override
  final PaymentType type;
  @override
  final double amount;
  @override
  final String vendor;
  @override
  final String address;
  @override
  final bool? paidForAnother;
  @override
  final bool? paidBack;

  @override
  String toString() {
    return 'Spending(id: $id, date: $date, category: $category, type: $type, amount: $amount, vendor: $vendor, address: $address, paidForAnother: $paidForAnother, paidBack: $paidBack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.paidForAnother, paidForAnother) ||
                other.paidForAnother == paidForAnother) &&
            (identical(other.paidBack, paidBack) ||
                other.paidBack == paidBack));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, category, type, amount,
      vendor, address, paidForAnother, paidBack);

  /// Create a copy of Spending
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingImplCopyWith<_$SpendingImpl> get copyWith =>
      __$$SpendingImplCopyWithImpl<_$SpendingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendingImplToJson(
      this,
    );
  }
}

abstract class _Spending implements Spending {
  const factory _Spending(
      {final int? id,
      required final DateTime date,
      required final String category,
      required final PaymentType type,
      required final double amount,
      required final String vendor,
      required final String address,
      final bool? paidForAnother,
      final bool? paidBack}) = _$SpendingImpl;

  factory _Spending.fromJson(Map<String, dynamic> json) =
      _$SpendingImpl.fromJson;

  @override
  int? get id;
  @override
  DateTime get date;
  @override
  String get category;
  @override
  PaymentType get type;
  @override
  double get amount;
  @override
  String get vendor;
  @override
  String get address;
  @override
  bool? get paidForAnother;
  @override
  bool? get paidBack;

  /// Create a copy of Spending
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpendingImplCopyWith<_$SpendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
