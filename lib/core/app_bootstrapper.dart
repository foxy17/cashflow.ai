import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../router/app_router.dart';
import 'app_initializer.dart';

class AppBootstrapper extends ConsumerWidget {
  const AppBootstrapper({
    super.key,
    required this.router,
    required this.child,
  });

  final AppRouter router;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appInitializerProvider, (previous, next) {
      next.whenOrNull(
        data: (_) => router.replace(const MainRoute()),
        error: (error, _) => router.replace(
          ErrorRoute(error: error.toString()),
        ),
      );
    });

    return child;
  }
}
