import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../router/app_router.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  static const String name = 'MainScreen';
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeTabRoute(),
        ReportTabRoute(),
        UserTabRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
        );
      },
    );
  }
}
