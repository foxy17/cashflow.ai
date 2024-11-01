// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processed_sms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessedSms _$ProcessedSmsFromJson(Map<String, dynamic> json) {
  return _ProcessedSms.fromJson(json);
}

/// @nodoc
mixin _$ProcessedSms {
  String get smsId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Serializes this ProcessedSms to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProcessedSms
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProcessedSmsCopyWith<ProcessedSms> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessedSmsCopyWith<$Res> {
  factory $ProcessedSmsCopyWith(
          ProcessedSms value, $Res Function(ProcessedSms) then) =
      _$ProcessedSmsCopyWithImpl<$Res, ProcessedSms>;
  @useResult
  $Res call({String smsId, DateTime date});
}

/// @nodoc
class _$ProcessedSmsCopyWithImpl<$Res, $Val extends ProcessedSms>
    implements $ProcessedSmsCopyWith<$Res> {
  _$ProcessedSmsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProcessedSms
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smsId = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      smsId: null == smsId
          ? _value.smsId
          : smsId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessedSmsImplCopyWith<$Res>
    implements $ProcessedSmsCopyWith<$Res> {
  factory _$$ProcessedSmsImplCopyWith(
          _$ProcessedSmsImpl value, $Res Function(_$ProcessedSmsImpl) then) =
      __$$ProcessedSmsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String smsId, DateTime date});
}

/// @nodoc
class __$$ProcessedSmsImplCopyWithImpl<$Res>
    extends _$ProcessedSmsCopyWithImpl<$Res, _$ProcessedSmsImpl>
    implements _$$ProcessedSmsImplCopyWith<$Res> {
  __$$ProcessedSmsImplCopyWithImpl(
      _$ProcessedSmsImpl _value, $Res Function(_$ProcessedSmsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessedSms
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smsId = null,
    Object? date = null,
  }) {
    return _then(_$ProcessedSmsImpl(
      smsId: null == smsId
          ? _value.smsId
          : smsId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessedSmsImpl implements _ProcessedSms {
  const _$ProcessedSmsImpl({required this.smsId, required this.date});

  factory _$ProcessedSmsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessedSmsImplFromJson(json);

  @override
  final String smsId;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'ProcessedSms(smsId: $smsId, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessedSmsImpl &&
            (identical(other.smsId, smsId) || other.smsId == smsId) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, smsId, date);

  /// Create a copy of ProcessedSms
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessedSmsImplCopyWith<_$ProcessedSmsImpl> get copyWith =>
      __$$ProcessedSmsImplCopyWithImpl<_$ProcessedSmsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessedSmsImplToJson(
      this,
    );
  }
}

abstract class _ProcessedSms implements ProcessedSms {
  const factory _ProcessedSms(
      {required final String smsId,
      required final DateTime date}) = _$ProcessedSmsImpl;

  factory _ProcessedSms.fromJson(Map<String, dynamic> json) =
      _$ProcessedSmsImpl.fromJson;

  @override
  String get smsId;
  @override
  DateTime get date;

  /// Create a copy of ProcessedSms
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessedSmsImplCopyWith<_$ProcessedSmsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
