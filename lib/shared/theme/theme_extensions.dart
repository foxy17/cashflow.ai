import 'package:flutter/material.dart';
import 'theme_provider.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';
import 'app_theme_data.dart';

extension ThemeExtension on BuildContext {
  AppThemeData get theme => ThemeProvider.of(this).current;
  AppColors get colors => theme.colors;
  AppTextTheme get textTheme => theme.textTheme;
  ThemeMode get themeMode => ThemeProvider.of(this).mode;
  void toggleTheme() => ThemeProvider.of(this).toggle();
  ColorScheme get colorScheme => theme.materialTheme.colorScheme;
}
