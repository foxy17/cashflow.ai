import 'package:another_telephony/telephony.dart';
import 'package:cashflow_ai/core/app_bootstrapper.dart';
import 'package:cashflow_ai/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'shared/theme/theme_provider.dart';
import 'shared/theme/app_text_theme.dart';
import 'core/theme/theme_factory.dart';
import 'router/app_router.dart';

@pragma('vm:entry-point')
backgroundMessageHandler(SmsMessage message) async {
  // Handle background message
  print("SMS Received in background!");
  print("From: ${message.address}");
  print("Message: ${message.body}");

  // Perform any background tasks
  // Note: Avoid heavy computations here as Android may kill long-running background operations
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final appRouter = AppRouter();

  runApp(
    ProviderScope(
      child: MyApp(appRouter: appRouter),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return ThemeProvider(
          notifier: AppTheme.uniform(
            themeFactory: const UniversalThemeFactory(),
            lightColors: AppColors(),
            darkColors: AppColors(),
            textTheme: AppTextTheme.build(),
            defaultMode: ThemeMode.system,
          ),
          child: Builder(
            builder: (context) {
              return AppBootstrapper(
                router: appRouter,
                child: MaterialApp.router(
                  routerConfig: appRouter.config(),
                  title: 'Cashflow.ai',
                  theme: context.theme.materialTheme,
                  darkTheme: context.theme.materialTheme.copyWith(
                    brightness: Brightness.dark,
                  ),
                  themeMode: context.themeMode,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
