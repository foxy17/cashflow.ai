import 'package:cashflow_ai/features/home/presentation/pages/home_tab.dart';
import 'package:cashflow_ai/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
              color: context.colorScheme.onTertiary,
              borderRadius: BorderRadius.circular(32.w)),
          child: Text(
            'November',
            style: context.textTheme.titleLarge.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: context.colorScheme.onSurface),
          ),
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: context.colorScheme.onTertiary,
              radius: 32.r,
              child: IconButton(
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: context.colorScheme.onTertiary,
                ),
                onPressed: () {},
                icon: Icon(
                  Ionicons.notifications_outline,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            4.sbw,
            CircleAvatar(
              radius: 32.r,
              backgroundColor: colorScheme.onTertiary,
              child: Icon(
                Icons.person,
                color: colorScheme.onTertiary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
