import 'package:flutter/material.dart';
import 'package:cashflow_ai/shared/shared.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Statistics',
              style: textTheme.titleMedium,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: colorScheme.onSurface,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ),
        16.sbh,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Set your limit',
                  style: textTheme.titleMedium,
                ),
                8.sbw,
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    size: 20.r,
                    color: colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            Text(
              '\$1200.00',
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
        Text(
          'Monthly spending limit',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
} 