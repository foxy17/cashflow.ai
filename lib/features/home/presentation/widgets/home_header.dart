import 'package:cashflow_ai/core/providers/user_preferences_provider.dart';
import 'package:cashflow_ai/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

import 'avatar_selection_modal.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  void _showAvatarSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.w)),
      ),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: const AvatarSelectionModal(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final userProfile = ref.watch(userPreferencesNotifierProvider);
    final avatarPath = userProfile?.profileImagePath ?? 'Avatar-1.png';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: context.colorScheme.onTertiary,
            borderRadius: BorderRadius.circular(32.w),
          ),
          child: Text(
            'November',
            style: context.textTheme.bodyLarge.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: context.colorScheme.onSurface,
            ),
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
            GestureDetector(
              onTap: () => _showAvatarSelectionModal(context),
              child: CircleAvatar(
                radius: 32.r,
                backgroundColor: colorScheme.onTertiary,
                child: Padding(
                  padding: EdgeInsets.all(6.w),
                  child: Image.asset('assets/avatars/$avatarPath'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
