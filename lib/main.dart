import 'package:cashflow_ai/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'shared/theme/theme_provider.dart';
import 'shared/theme/app_text_theme.dart';
import 'core/theme/theme_factory.dart';
import 'router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key}) : _appRouter = AppRouter();

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return ThemeProvider(
          notifier: AppTheme.uniform(
            themeFactory: const UniversalThemeFactory(),
            lightColors: AppColors(),
            darkColors: AppColors(), // Create a dark version of colors
            textTheme: AppTextTheme.build(),
            defaultMode: ThemeMode.system,
          ),
          child: Builder(
            builder: (context) {
              return AppStartup(
                onInitialized: (context) {
                  return MaterialApp.router(
                    routerConfig: _appRouter.config(),
                    title: 'Cashflow.ai',
                    theme: context.theme.materialTheme,
                    darkTheme: context.theme.materialTheme.copyWith(
                      brightness: Brightness.dark,
                    ),
                    themeMode: context.themeMode,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
