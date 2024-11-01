import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cashflow_ai/core/permissions/permission_handler.dart';
import 'package:cashflow_ai/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ionicons/ionicons.dart';

@RoutePage()
class StoragePermissionScreen extends StatefulWidget {
  const StoragePermissionScreen({super.key});

  @override
  State<StoragePermissionScreen> createState() => _StoragePermissionScreenState();
}

class _StoragePermissionScreenState extends State<StoragePermissionScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkAndNavigateIfPermissionGranted();
    }
  }

  Future<void> _checkAndNavigateIfPermissionGranted() async {
    final bool hasPermission = await PermissionHandler.checkStoragePermission();
    if (hasPermission && mounted) {
      context.router.replaceNamed('/home');
    }
  }

  String get _permissionMessage => Platform.isAndroid 
    ? 'This app requires storage permission to store your data. On newer Android versions, you\'ll need to grant "All files access" permission for the app to work properly.'
    : 'This app requires storage permission to store your data securely.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Storage Permission Required')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _permissionMessage,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge.copyWith(
                  fontSize: 18.sp,
                  color: context.theme.colors.gunMetal,
                  fontWeight: FontWeight.w600,
                ),
              ),
              24.sbh,
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => openAppSettings(),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.h),
                        backgroundColor: context.colorScheme.onSurface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                      ),
                      icon: Icon(
                        Ionicons.settings_sharp,
                        color: context.colorScheme.onTertiary,
                        size: 20.sp,
                      ),
                      label: Text(
                        'Open Settings',
                        style: context.textTheme.bodyLarge.copyWith(
                          color: context.colorScheme.onTertiary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  25.sbh,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => requestPermission(),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.h),
                        backgroundColor: context.colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                      ),
                      icon: Icon(
                        Ionicons.checkmark_circle,
                        color: context.colorScheme.onPrimary,
                        size: 20.sp,
                      ),
                      label: Text(
                        'Ask Permission',
                        style: context.textTheme.bodyLarge.copyWith(
                          color: context.colorScheme.onPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> requestPermission() async {
    final isGranted = await PermissionHandler.requestStoragePermission();
    if (isGranted && mounted) {
      context.router.replaceNamed('/home');
    }
  }
} 