import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

class AppThemeData {
  final AppColors colors;
  final AppTextTheme textTheme;
  final ThemeData materialTheme;

  const AppThemeData({
    required this.colors,
    required this.textTheme,
    required this.materialTheme,
  });
}
