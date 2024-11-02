import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cashflow_ai/core/models/models.dart';

class UserPreferences {
  static const String _keyUserProfile = 'user_profile';
  final SharedPreferences _prefs;

  UserPreferences(this._prefs);

  Future<void> saveUserProfile(UserProfile profile) async {
    await _prefs.setString(_keyUserProfile, jsonEncode(profile.toJson()));
  }

  UserProfile? getUserProfile() {
    final String? userStr = _prefs.getString(_keyUserProfile);
    if (userStr == null) return null;
    return UserProfile.fromJson(jsonDecode(userStr));
  }

  Future<void> updateMonthlySpending(double amount) async {
    final profile = getUserProfile();
    if (profile == null) return;

    await saveUserProfile(
      profile.copyWith(
        currentMonthSpending: amount,
        lastUpdated: DateTime.now(),
      ),
    );
  }

  Future<void> clear() async {
    await _prefs.remove(_keyUserProfile);
  }
} 