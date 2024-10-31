import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../core/permissions/permission_handler.dart';
import '../shared/ui/ui.dart';
import 'package:cashflow_ai/features/home/home.dart';
import 'package:cashflow_ai/features/report/report.dart';
import 'package:cashflow_ai/features/user/user.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, initial: true),
    AutoRoute(page: ErrorRoute.page),
    AutoRoute(
      page: MainRoute.page,
      guards: [PermissionGuard()],
      children: [
        AutoRoute(page: HomeTabRoute.page, initial: true),
        AutoRoute(page: ReportTabRoute.page),
        AutoRoute(page: UserTabRoute.page),
      ],
    ),
    AutoRoute(page: PermissionDeniedRoute.page),
  ];
}

class PermissionGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final hasPermission = await PermissionHandler.checkSmsPermission();
    if (!hasPermission) {
      router.push(const PermissionDeniedRoute());
    } else {
      resolver.next(true);
    }
  }
}
