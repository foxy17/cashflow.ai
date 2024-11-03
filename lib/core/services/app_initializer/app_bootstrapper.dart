import 'package:cashflow_ai/core/exceptions/app_exceptions.dart';
import 'package:cashflow_ai/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_initializer.dart';

class AppBootstrapper extends ConsumerWidget {
  final AppRouter router;
  final Widget child;

  const AppBootstrapper({
    super.key,
    required this.router,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appInitializerProvider, (previous, next) {
      next.whenOrNull(
        data: (_) => router.replace(const MainRoute()),
        error: (error, _) {
          if (error is PermissionDeniedException) {
            router.replace(const PermissionDeniedRoute());
          } else if (error is StoragePermissionDeniedException) {
            router.replace(const StoragePermissionRoute());
          } else {
            router.replace(ErrorRoute(error: error.toString()));
          }
        },
      );
    });

    return child;
  }
}
