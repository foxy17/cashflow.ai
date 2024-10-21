import 'package:auto_route/auto_route.dart';
import 'package:cashflow_ai/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class PermissionDeniedScreen extends StatelessWidget {
  static const String name = 'PermissionDeniedScreen';
  const PermissionDeniedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Permission Required')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This app requires SMS permission to function properly.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            20.sbh,
            ElevatedButton(
              onPressed: () => openAppSettings(),
              child: const Text('Open Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
