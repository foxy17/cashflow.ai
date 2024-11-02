// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      profileImagePath: json['profileImagePath'] as String?,
      monthlySpendingLimit: (json['monthlySpendingLimit'] as num).toDouble(),
      currentMonthSpending: (json['currentMonthSpending'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profileImagePath': instance.profileImagePath,
      'monthlySpendingLimit': instance.monthlySpendingLimit,
      'currentMonthSpending': instance.currentMonthSpending,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
