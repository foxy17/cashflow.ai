import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cashflow_ai/shared/shared.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/widgets.dart';

@RoutePage()
class HomeTabScreen extends StatelessWidget {
  static const String name = 'HomeTabScreen';
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.sbh,
              const HomeHeader(),
              16.sbh,
              const MonthlyBalanceCard(),
              4.sbh,
              const SpendingStatusCard(),
              24.sbh,
              const BuddyPlannerCard(),
              24.sbh,
              const CategorySlider(),
              24.sbh,
              const StatisticsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
