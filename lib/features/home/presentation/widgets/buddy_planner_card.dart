import 'package:cashflow_ai/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuddyPlannerCard extends StatelessWidget {
  const BuddyPlannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 16.r,
                        backgroundColor: colorScheme.primaryContainer,
                      ),
                      Positioned(
                        left: 16.w,
                        child: CircleAvatar(
                          radius: 16.r,
                          backgroundColor: colorScheme.secondaryContainer,
                        ),
                      ),
                    ],
                  ),
                  24.sbw,
                  Text(
                    'Buddy Planner',
                    style: textTheme.titleMedium,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          16.sbh,
          Text(
            'Total Expensed',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          8.sbh,
          Text(
            '\$1240',
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
} 