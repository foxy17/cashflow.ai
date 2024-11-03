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
        Text(
          'Left balance',
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        8.sbh,
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$420',
              style: textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '.50',
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
        16.sbh,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '\$424 of \$920 spent',
                style: textTheme.bodyMedium,
              ),
              8.sbw,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Text(
                  '+ 15% than last month',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 