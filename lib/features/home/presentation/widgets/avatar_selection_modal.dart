import 'package:auto_route/auto_route.dart';
import 'package:cashflow_ai/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cashflow_ai/core/providers/user_preferences_provider.dart';

class AvatarSelectionModal extends ConsumerWidget {
  const AvatarSelectionModal({super.key});

  static const List<String> _avatarOptions = [
    'Avatar-1.png',
    'Avatar-2.png',
    'Avatar-3.png',
    'Avatar-4.png',
    'Avatar-5.png',
    'Avatar-6.png',
    'Avatar-7.png',
    'Avatar-8.png',
    'Avatar-9.png',
    'Avatar-10.png',
    'Avatar-11.png',
    'Avatar-12.png',
    'Avatar-13.png',
    'Avatar-14.png',
    'Avatar-15.png',
    'Avatar-16.png',
    'Avatar-17.png',
    'Avatar-18.png',
    'Avatar-19.png',
    'Avatar-20.png',
    'Avatar-21.png',
    'Avatar-31.png',
    'Avatar-41.png',
    'Avatar-51.png',
    'Avatar-61.png',
    'Avatar-71.png',
    'Avatar-81.png',
    'Avatar-91.png',
    'Avatar-101.png',
    'Avatar-111.png',
    'Avatar-121.png',
    'Avatar-131.png',
    'Avatar-141.png',
    'Avatar-151.png',
    // Add more avatar options as needed
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select Avatar',
            style: context.textTheme.titleLarge.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.w400,
            ),
          ),
          16.sbh,
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _avatarOptions.length,
              itemBuilder: (context, index) {
                final avatar = _avatarOptions[index];
                return GestureDetector(
                  onTap: () async {
                    // Update avatar in preferences
                    final notifier =
                        ref.read(userPreferencesNotifierProvider.notifier);
                    final currentProfile =
                        ref.read(userPreferencesNotifierProvider);

                    if (currentProfile != null) {
                      await notifier.saveProfile(
                        currentProfile.copyWith(profileImagePath: avatar),
                      );
                    }
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.colorScheme.primary,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                      color: context.colorScheme.onTertiary,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Image.asset(
                        'assets/avatars/$avatar',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
