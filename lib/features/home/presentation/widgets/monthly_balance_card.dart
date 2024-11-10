import 'package:flutter/material.dart';
import 'package:cashflow_ai/shared/shared.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthlyBalanceCard extends StatelessWidget {
  const MonthlyBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '₹',
                  style: textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 40.sp,
                  ),
                ),
                8.sbw,
                Text(
                  '${10000.toFormattedString()}',
                  style: textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 40.sp,
                    letterSpacing: -4.sp,
                    textBaseline: TextBaseline.ideographic,
                  ),
                ),
                Transform.translate(
                  // Added Transform to adjust position
                  offset:
                      Offset(0, -4.w), // Adjust the vertical offset as needed
                  child: Text(
                    '.50',
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurface.withOpacity(0.7),
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.sp,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: Offset(0, -4.w),
              child: Text(
                'Left balance',
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
