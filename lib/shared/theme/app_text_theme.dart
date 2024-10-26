import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle labelLarge;

  const AppTextTheme({
    required this.displayLarge,
    required this.displayMedium,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.labelLarge,
  });

  static AppTextTheme build() {
    return AppTextTheme(
      displayLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
