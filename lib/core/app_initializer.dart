import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'permissions/permission_handler.dart';

part 'app_initializer.g.dart';
final getIt = GetIt.instance;

@riverpod
class AppInitializer extends _$AppInitializer {
  @override
  Future<void> build() => _initialize();

  Future<void> _initialize() async {
    await ScreenUtil.ensureScreenSize();

    // Initialize GetIt dependencies
    _initializeGetIt();

    // Check SMS permission
    final hasPermission = await PermissionHandler.checkSmsPermission();
    if (!hasPermission) {
      // The router will handle navigation to PermissionDeniedScreen
      throw const PermissionDeniedException();
    }
  }

  void _initializeGetIt() {
    // Add your GetIt registrations here
  }
}

class PermissionDeniedException implements Exception {
  const PermissionDeniedException();
}
