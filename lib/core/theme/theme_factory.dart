import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          brightness: Brightness.dark,
          seedColor: colors.emerald,
          // Use surface instead of background
          surface: colors.antiflashWhite,
          onSurface: colors.gunMetal,
          primary: colors.emerald,
          onPrimary: colors.black,
          error: colors.bittersweet,
          onError: colors.antiflashWhite,
          tertiary: colors.lightBlack,
          onTertiary: colors.white,
          surfaceContainer: colors.platinum,
          surfaceContainerHigh: colors.darkGunMetal,
        ),
        useMaterial3: true, // Material 3 is now default
        textTheme: GoogleFonts.interTextTheme(TextTheme(
          displayLarge: textTheme.displayLarge,
          displayMedium: textTheme.displayMedium,
          bodyLarge: textTheme.bodyLarge,
          bodyMedium: textTheme.bodyMedium,
          labelLarge: textTheme.labelLarge,
        )).copyWith(
          
        ),
      ),
    );
  }
}
