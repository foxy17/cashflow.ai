import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumExtensions on num {
  SizedBox get sbh => SizedBox(height: h);
  SizedBox get sbw => SizedBox(width: w);
}

extension NumberFormatting on num {
  /// Formats a number with commas as thousand separators
  /// Example: 10000 becomes "10,000"
  String toFormattedString() {
    if (this == 0) return '0';
    
    final parts = toString().split('.');
    final wholePart = parts[0];
    final decimalPart = parts.length > 1 ? '.${parts[1]}' : '';
    
    final regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    final result = wholePart.replaceAllMapped(
      regex,
      (match) => '${match[1]},',
    );
    
    return result + decimalPart;
  }

  /// Formats a number with commas and currency symbol
  /// Example: 10000 becomes "$10,000"
  String toCurrencyString({String symbol = '₹'}) {
    return '$symbol${toFormattedString()}';
  }
} 