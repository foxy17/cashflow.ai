import 'package:auto_route/auto_route.dart';
import '../shared/ui/screens/main_screen.dart';
import '../shared/ui/screens/permission_denied_screen.dart';
import 'package:cashflow_ai/features/home/home.dart';
import 'package:cashflow_ai/features/report/report.dart';
import 'package:cashflow_ai/features/user/user.dart';


part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page, initial: true, children: [
      AutoRoute(page: HomeTabRoute.page, initial: true),
          AutoRoute(page: ReportTabRoute.page),
          AutoRoute(page: UserTabRoute.page),
        ],
      ),
      AutoRoute(page: PermissionDeniedRoute.page),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}
