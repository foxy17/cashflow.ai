import 'package:cashflow_ai/core/providers/user_preferences_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../permissions/permission_handler.dart';
import '../database_service.dart';
import '../../exceptions/app_exceptions.dart';

part 'app_initializer.g.dart';
final getIt = GetIt.instance;

@riverpod
class AppInitializer extends _$AppInitializer {
  @override
  Future<void> build() => _initialize();

  Future<void> _initialize() async {
    try {
      await ScreenUtil.ensureScreenSize();

      // Initialize GetIt dependencies
      await _initializeGetIt();

      // Initialize UserPreferences provider
      ref.read(userPreferencesNotifierProvider);

      // Check SMS permission
      final hasSmsPermission = await PermissionHandler.checkSmsPermission();
      if (!hasSmsPermission) {
        throw const PermissionDeniedException('SMS permission required');
      }

      // Check storage permission
      final hasStoragePermission = await PermissionHandler.checkStoragePermission();
      if (!hasStoragePermission) {
        throw const StoragePermissionDeniedException();
      }

      // Initialize database
      await DatabaseService.instance.database;
    } on PermissionDeniedException catch (e) {
      rethrow;  // Re-throw permission exceptions as-is
    } on StoragePermissionDeniedException catch (e) {
      rethrow;  // Re-throw storage permission exceptions as-is
    } catch (e) {
      // Wrap other exceptions in InitializationException
      throw InitializationException('Failed to initialize app: $e');
    }
  }

  Future<void> _initializeGetIt() async {
    // Initialize SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    // Register SharedPreferences as singleton
    getIt.registerSingleton<SharedPreferences>(prefs);
  }
}
