import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static Future<bool> requestSmsPermission() async {
    final status = await Permission.sms.request();
    return status.isGranted;
  }

  static Future<bool> checkSmsPermission() async {
    return await Permission.sms.isGranted;
  }

  static Future<bool> requestStoragePermission() async {
    if (!Platform.isAndroid) return true;

    // For Android 11 (API level 30) and above
    if (await isAndroid11OrHigher()) {
      final status = await Permission.manageExternalStorage.request();
      return status.isGranted;
    }
    
    // For Android 10 and below
    final status = await Permission.storage.request();
    return status.isGranted;
  }

  static Future<bool> checkStoragePermission() async {
    if (!Platform.isAndroid) return true;

    // For Android 11 (API level 30) and above
    if (await isAndroid11OrHigher()) {
      return await Permission.manageExternalStorage.isGranted;
    }
    
    // For Android 10 and below
    return await Permission.storage.isGranted;
  }

  static Future<bool> isAndroid11OrHigher() async {
    if (!Platform.isAndroid) return false;
    return int.parse(await _getAndroidVersion()) >= 30;
  }

  static Future<String> _getAndroidVersion() async {
    try {
      return Platform.operatingSystemVersion
          .replaceAll(RegExp(r'[^0-9]'), '')
          .padLeft(2, '0');
    } catch (e) {
      return '00';
    }
  }
}
