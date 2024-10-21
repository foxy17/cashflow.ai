import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static Future<bool> requestSmsPermission() async {
    final status = await Permission.sms.request();
    return status.isGranted;
  }

  static Future<bool> checkSmsPermission() async {
    return await Permission.sms.isGranted;
  }
}
