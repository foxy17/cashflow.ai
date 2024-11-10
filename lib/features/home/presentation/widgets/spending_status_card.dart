import 'package:cashflow_ai/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpendingStatusCard extends ConsumerWidget {
  const SpendingStatusCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final spentAmount = 4000;
    final totalAmount = 10000;
    final percentageChange = 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return _buildBars(
              spentAmount.toDouble(),
              totalAmount.toDouble(),
              colorScheme,
              constraints.maxWidth,
            );
          },
        ),
        10.sbh, // Space between bars and text
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${spentAmount.toCurrencyString()}',
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 18.sp,
                letterSpacing: -2.sp,
              ),
            ),
            4.sbw,
            Text(
              'of ${totalAmount.toCurrencyString()} spent',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.4),
                fontSize: 18.sp,
                letterSpacing: -2.sp,
                wordSpacing: 4.sp,
              ),
            ),
            8.sbw,
            if (percentageChange > 0)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Text(
                  '+ $percentageChange% than last month',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildBars(
    double spentAmount,
    double totalAmount,
    ColorScheme colorScheme,
    double availableWidth,
  ) {
    const barCount = 4;
    final gapWidth = 4.w; // Gap between bars
    final totalGapWidth = gapWidth * (barCount - 1); // Total gap width
    final totalBarWidth =
        availableWidth - totalGapWidth; // Total width available for bars
    final barWidth = totalBarWidth / barCount; // Width of each bar

    // Calculate the filled width based on the spent amount
    final spentPercentage = (spentAmount / totalAmount).clamp(0.0, 1.0);
    final filledWidth = totalBarWidth * spentPercentage;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(barCount, (index) {
        double currentBarWidth = barWidth;
        Color barColor;

        // Determine the color and width for each bar
        if (index < (filledWidth / barWidth).floor()) {
          // Fully filled bars
          barColor = colorScheme.onPrimary;
        } else if (index == (filledWidth / barWidth).floor()) {
          // Partially filled bar
          currentBarWidth =
              (filledWidth - (barWidth * index)).clamp(0.0, barWidth);
          barColor = colorScheme.onPrimary;
        } else {
          // Unfilled bars
          barColor = colorScheme.surfaceContainer;
        }

        return Container(
          width: barWidth,
          height: 12.h,
          margin: EdgeInsets.only(
              right: index < barCount - 1
                  ? gapWidth
                  : 0), // Add gap only between bars
          decoration: currentBarWidth < barWidth
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  gradient: LinearGradient(
                    stops: [
                      currentBarWidth / barWidth,
                      currentBarWidth / barWidth
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      colorScheme.onPrimary,
                      colorScheme.surfaceContainer, // Top right part
                    ],
                  ))
              : BoxDecoration(
                  color: barColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
        );
      }),
    );
  }
}
