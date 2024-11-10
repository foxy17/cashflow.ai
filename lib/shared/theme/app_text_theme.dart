import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle labelLarge;
  final TextStyle titleLarge;

  const AppTextTheme({
    required this.displayLarge,
    required this.displayMedium,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.labelLarge,
    required this.titleLarge,
  });

  static AppTextTheme build() {
    return AppTextTheme(
      titleLarge: GoogleFonts.inter(
        fontSize: 24.sp,
      ),
      displayLarge: GoogleFonts.inter(
        fontSize: 24.sp,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 20.sp,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16.sp,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14.sp,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 16.sp,
      ),
    );
  }
}
