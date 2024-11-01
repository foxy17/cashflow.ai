import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'permissions/permission_handler.dart';
import 'services/database_service.dart';
import 'exceptions/app_exceptions.dart';

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
      _initializeGetIt();

      // Check SMS permission
      final hasPermission = await PermissionHandler.checkSmsPermission();
      if (!hasPermission) {
        throw const PermissionDeniedException();
      }

      // Check and request storage permissions
      final hasStoragePermission = await DatabaseService.checkAndRequestPermissions();
      if (!hasStoragePermission) {
        throw const StoragePermissionDeniedException();
      }

      // Initialize database
      await DatabaseService.instance.database;
    } catch (e) {
      throw InitializationException('Failed to initialize app: $e');
    }
  }

  void _initializeGetIt() {
    // Add your GetIt registrations here
  }
}
