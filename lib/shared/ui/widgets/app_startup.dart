import 'package:cashflow_ai/core/services/app_initializer/app_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/permissions/permission_handler.dart';
import '../screens/permission_denied_screen.dart';

class AppStartup extends ConsumerWidget {
  const AppStartup({super.key, required this.onInitialized});

  final WidgetBuilder onInitialized;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initializationState = ref.watch(appInitializerProvider);

    return initializationState.when(
      data: (_) => FutureBuilder<bool>(
        future: PermissionHandler.checkSmsPermission(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator())));
          }
          if (snapshot.data == true) {
            return onInitialized(context);
          }
          return const MaterialApp(home: PermissionDeniedScreen());
        },
      ),
      loading: () => const MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator()))),
      error: (error, stack) => MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
