import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
   /*  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ); */

    await ScreenUtil.ensureScreenSize();

    // Initialize GetIt dependencies
    _initializeGetIt();

    // Request SMS permission
    await PermissionHandler.requestSmsPermission();
  }

  void _initializeGetIt() {
    // Add your GetIt registrations here
    // For example:
    // getIt.registerSingleton<SomeService>(SomeService());
  }
}
