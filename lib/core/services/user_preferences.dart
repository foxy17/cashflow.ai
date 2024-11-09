import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cashflow_ai/core/models/models.dart';

class UserPreferences {
  static const String _profileKey = 'user_profile';
  static const String _defaultAvatar = 'Avatar-1.svg';
  
  final SharedPreferences _prefs;

  UserPreferences(this._prefs);

  UserProfile? getUserProfile() {
    final profileJson = _prefs.getString(_profileKey);
    if (profileJson == null) return null;
    
    try {
      return UserProfile.fromJson(
        json.decode(profileJson) as Map<String, dynamic>,
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> saveUserProfile(UserProfile profile) async {
    await _prefs.setString(_profileKey, json.encode(profile.toJson()));
  }

  Future<void> updateAvatar(String avatarName) async {
    final profile = getUserProfile();
    if (profile == null) return;

    final updatedProfile = profile.copyWith(
      profileImagePath: avatarName,
      lastUpdated: DateTime.now(),
    );
    
    await saveUserProfile(updatedProfile);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
} 