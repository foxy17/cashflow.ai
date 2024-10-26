import 'package:flutter/material.dart';
import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_theme_data.dart';
import '../../shared/theme/app_text_theme.dart';

abstract class AppThemeDataFactory {
  const AppThemeDataFactory();

  AppThemeData build({
    required AppColors colors,
    required AppTextTheme textTheme,
  });
}

class UniversalThemeFactory extends AppThemeDataFactory {
  const UniversalThemeFactory();

  @override
  AppThemeData build({
    required AppColors colors,
    required AppTextTheme textTheme,
  }) {
    return AppThemeData(
      colors: colors,
      textTheme: textTheme,
      materialTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: colors.emerald,
          // Use surface instead of background
          surface: colors.antiflashWhite,
          onSurface: colors.gunMetal,
          primary: colors.emerald,
          error: colors.bittersweet,
          onError: colors.antiflashWhite,
          // Add surfaceContainer colors for proper elevation tinting
          surfaceContainer: colors.platinum,
          surfaceContainerHigh: colors.darkGunMetal,
        ),
        useMaterial3: true, // Material 3 is now default
        textTheme: TextTheme(
          displayLarge: textTheme.displayLarge,
          displayMedium: textTheme.displayMedium,
          bodyLarge: textTheme.bodyLarge,
          bodyMedium: textTheme.bodyMedium,
          labelLarge: textTheme.labelLarge,
        ),
      ),
    );
  }
}
