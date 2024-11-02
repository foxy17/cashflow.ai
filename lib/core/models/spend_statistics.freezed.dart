// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spend_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpendStatistics _$SpendStatisticsFromJson(Map<String, dynamic> json) {
  return _SpendStatistics.fromJson(json);
}

/// @nodoc
mixin _$SpendStatistics {
  int? get id => throw _privateConstructorUsedError;
  DateTime get month => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  double get percentDifference => throw _privateConstructorUsedError;
  String get mostSpentCategory => throw _privateConstructorUsedError;
  String get mostUsedPaymentMode => throw _privateConstructorUsedError;
  Map<String, double>? get categoryBreakdown =>
      throw _privateConstructorUsedError;
  Map<String, double>? get paymentModeBreakdown =>
      throw _privateConstructorUsedError;

  /// Serializes this SpendStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpendStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpendStatisticsCopyWith<SpendStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendStatisticsCopyWith<$Res> {
  factory $SpendStatisticsCopyWith(
          SpendStatistics value, $Res Function(SpendStatistics) then) =
      _$SpendStatisticsCopyWithImpl<$Res, SpendStatistics>;
  @useResult
  $Res call(
      {int? id,
      DateTime month,
      double totalSpent,
      double percentDifference,
      String mostSpentCategory,
      String mostUsedPaymentMode,
      Map<String, double>? categoryBreakdown,
      Map<String, double>? paymentModeBreakdown});
}

/// @nodoc
class _$SpendStatisticsCopyWithImpl<$Res, $Val extends SpendStatistics>
    implements $SpendStatisticsCopyWith<$Res> {
  _$SpendStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpendStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? month = null,
    Object? totalSpent = null,
    Object? percentDifference = null,
    Object? mostSpentCategory = null,
    Object? mostUsedPaymentMode = null,
    Object? categoryBreakdown = freezed,
    Object? paymentModeBreakdown = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      percentDifference: null == percentDifference
          ? _value.percentDifference
          : percentDifference // ignore: cast_nullable_to_non_nullable
              as double,
      mostSpentCategory: null == mostSpentCategory
          ? _value.mostSpentCategory
          : mostSpentCategory // ignore: cast_nullable_to_non_nullable
              as String,
      mostUsedPaymentMode: null == mostUsedPaymentMode
          ? _value.mostUsedPaymentMode
          : mostUsedPaymentMode // ignore: cast_nullable_to_non_nullable
              as String,
      categoryBreakdown: freezed == categoryBreakdown
          ? _value.categoryBreakdown
          : categoryBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      paymentModeBreakdown: freezed == paymentModeBreakdown
          ? _value.paymentModeBreakdown
          : paymentModeBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpendStatisticsImplCopyWith<$Res>
    implements $SpendStatisticsCopyWith<$Res> {
  factory _$$SpendStatisticsImplCopyWith(_$SpendStatisticsImpl value,
          $Res Function(_$SpendStatisticsImpl) then) =
      __$$SpendStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      DateTime month,
      double totalSpent,
      double percentDifference,
      String mostSpentCategory,
      String mostUsedPaymentMode,
      Map<String, double>? categoryBreakdown,
      Map<String, double>? paymentModeBreakdown});
}

/// @nodoc
class __$$SpendStatisticsImplCopyWithImpl<$Res>
    extends _$SpendStatisticsCopyWithImpl<$Res, _$SpendStatisticsImpl>
    implements _$$SpendStatisticsImplCopyWith<$Res> {
  __$$SpendStatisticsImplCopyWithImpl(
      _$SpendStatisticsImpl _value, $Res Function(_$SpendStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpendStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? month = null,
    Object? totalSpent = null,
    Object? percentDifference = null,
    Object? mostSpentCategory = null,
    Object? mostUsedPaymentMode = null,
    Object? categoryBreakdown = freezed,
    Object? paymentModeBreakdown = freezed,
  }) {
    return _then(_$SpendStatisticsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      percentDifference: null == percentDifference
          ? _value.percentDifference
          : percentDifference // ignore: cast_nullable_to_non_nullable
              as double,
      mostSpentCategory: null == mostSpentCategory
          ? _value.mostSpentCategory
          : mostSpentCategory // ignore: cast_nullable_to_non_nullable
              as String,
      mostUsedPaymentMode: null == mostUsedPaymentMode
          ? _value.mostUsedPaymentMode
          : mostUsedPaymentMode // ignore: cast_nullable_to_non_nullable
              as String,
      categoryBreakdown: freezed == categoryBreakdown
          ? _value._categoryBreakdown
          : categoryBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      paymentModeBreakdown: freezed == paymentModeBreakdown
          ? _value._paymentModeBreakdown
          : paymentModeBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpendStatisticsImpl implements _SpendStatistics {
  const _$SpendStatisticsImpl(
      {this.id,
      required this.month,
      required this.totalSpent,
      required this.percentDifference,
      required this.mostSpentCategory,
      required this.mostUsedPaymentMode,
      final Map<String, double>? categoryBreakdown,
      final Map<String, double>? paymentModeBreakdown})
      : _categoryBreakdown = categoryBreakdown,
        _paymentModeBreakdown = paymentModeBreakdown;

  factory _$SpendStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpendStatisticsImplFromJson(json);

  @override
  final int? id;
  @override
  final DateTime month;
  @override
  final double totalSpent;
  @override
  final double percentDifference;
  @override
  final String mostSpentCategory;
  @override
  final String mostUsedPaymentMode;
  final Map<String, double>? _categoryBreakdown;
  @override
  Map<String, double>? get categoryBreakdown {
    final value = _categoryBreakdown;
    if (value == null) return null;
    if (_categoryBreakdown is EqualUnmodifiableMapView)
      return _categoryBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, double>? _paymentModeBreakdown;
  @override
  Map<String, double>? get paymentModeBreakdown {
    final value = _paymentModeBreakdown;
    if (value == null) return null;
    if (_paymentModeBreakdown is EqualUnmodifiableMapView)
      return _paymentModeBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SpendStatistics(id: $id, month: $month, totalSpent: $totalSpent, percentDifference: $percentDifference, mostSpentCategory: $mostSpentCategory, mostUsedPaymentMode: $mostUsedPaymentMode, categoryBreakdown: $categoryBreakdown, paymentModeBreakdown: $paymentModeBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendStatisticsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.percentDifference, percentDifference) ||
                other.percentDifference == percentDifference) &&
            (identical(other.mostSpentCategory, mostSpentCategory) ||
                other.mostSpentCategory == mostSpentCategory) &&
            (identical(other.mostUsedPaymentMode, mostUsedPaymentMode) ||
                other.mostUsedPaymentMode == mostUsedPaymentMode) &&
            const DeepCollectionEquality()
                .equals(other._categoryBreakdown, _categoryBreakdown) &&
            const DeepCollectionEquality()
                .equals(other._paymentModeBreakdown, _paymentModeBreakdown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      month,
      totalSpent,
      percentDifference,
      mostSpentCategory,
      mostUsedPaymentMode,
      const DeepCollectionEquality().hash(_categoryBreakdown),
      const DeepCollectionEquality().hash(_paymentModeBreakdown));

  /// Create a copy of SpendStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendStatisticsImplCopyWith<_$SpendStatisticsImpl> get copyWith =>
      __$$SpendStatisticsImplCopyWithImpl<_$SpendStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendStatisticsImplToJson(
      this,
    );
  }
}

abstract class _SpendStatistics implements SpendStatistics {
  const factory _SpendStatistics(
      {final int? id,
      required final DateTime month,
      required final double totalSpent,
      required final double percentDifference,
      required final String mostSpentCategory,
      required final String mostUsedPaymentMode,
      final Map<String, double>? categoryBreakdown,
      final Map<String, double>? paymentModeBreakdown}) = _$SpendStatisticsImpl;

  factory _SpendStatistics.fromJson(Map<String, dynamic> json) =
      _$SpendStatisticsImpl.fromJson;

  @override
  int? get id;
  @override
  DateTime get month;
  @override
  double get totalSpent;
  @override
  double get percentDifference;
  @override
  String get mostSpentCategory;
  @override
  String get mostUsedPaymentMode;
  @override
  Map<String, double>? get categoryBreakdown;
  @override
  Map<String, double>? get paymentModeBreakdown;

  /// Create a copy of SpendStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpendStatisticsImplCopyWith<_$SpendStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
