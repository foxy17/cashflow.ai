import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cashflow_ai/core/models/models.dart';
import '../services/user_preferences.dart';

part 'user_preferences_provider.g.dart';

@Riverpod(keepAlive: true)
class UserPreferencesNotifier extends _$UserPreferencesNotifier {
  late final UserPreferences _preferences;

  @override
  UserProfile? build() {
    _preferences = UserPreferences(GetIt.instance<SharedPreferences>());
    return _initializeProfile();
  }

  UserProfile? _initializeProfile() {
    final existingProfile = _preferences.getUserProfile();
    if (existingProfile != null) {
      return existingProfile;
    }

    // Create and save default profile if none exists
    final defaultProfile = UserProfile(
      name: 'User',
      monthlySpendingLimit: 5000.0,
      currentMonthSpending: 0.0,
      lastUpdated: DateTime.now(),
      profileImagePath: 'Avatar-1.png',
    );
    
    _preferences.saveUserProfile(defaultProfile);
    return defaultProfile;
  }

  Future<void> saveProfile(UserProfile profile) async {
    await _preferences.saveUserProfile(profile);
    state = profile;
  }

  Future<void> updateMonthlySpending(double amount) async {
    if (state == null) return;
    
    final updatedProfile = state!.copyWith(
      currentMonthSpending: amount,
      lastUpdated: DateTime.now(),
    );
    
    await _preferences.saveUserProfile(updatedProfile);
    state = updatedProfile;
  }

  Future<void> clear() async {
    await _preferences.clear();
    state = null;
  }
}
