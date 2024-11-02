import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    int? id,
    required String name,
    String? profileImagePath,
    required double monthlySpendingLimit,
    required double currentMonthSpending,
    required DateTime lastUpdated,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  // Custom fromMap factory for Sembast
  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] as int?,
      name: map['name'] as String,
      profileImagePath: map['profileImagePath'] as String?,
      monthlySpendingLimit: map['monthlySpendingLimit'] as double,
      currentMonthSpending: map['currentMonthSpending'] as double,
      lastUpdated: DateTime.parse(map['lastUpdated'] as String),
    );
  }
}

extension UserProfileX on UserProfile {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'profileImagePath': profileImagePath,
      'monthlySpendingLimit': monthlySpendingLimit,
      'currentMonthSpending': currentMonthSpending,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }
} 