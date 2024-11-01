// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ErrorScreen]
class ErrorRoute extends PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    Key? key,
    required String error,
    List<PageRouteInfo>? children,
  }) : super(
          ErrorRoute.name,
          args: ErrorRouteArgs(
            key: key,
            error: error,
          ),
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ErrorRouteArgs>();
      return ErrorScreen(
        key: args.key,
        error: args.error,
      );
    },
  );
}

class ErrorRouteArgs {
  const ErrorRouteArgs({
    this.key,
    required this.error,
  });

  final Key? key;

  final String error;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, error: $error}';
  }
}

/// generated route for
/// [HomeTabScreen]
class HomeTabRoute extends PageRouteInfo<void> {
  const HomeTabRoute({List<PageRouteInfo>? children})
      : super(
          HomeTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeTabScreen();
    },
  );
}

/// generated route for
/// [LoadingScreen]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoadingScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [PermissionDeniedScreen]
class PermissionDeniedRoute extends PageRouteInfo<void> {
  const PermissionDeniedRoute({List<PageRouteInfo>? children})
      : super(
          PermissionDeniedRoute.name,
          initialChildren: children,
        );

  static const String name = 'PermissionDeniedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PermissionDeniedScreen();
    },
  );
}

/// generated route for
/// [ReportTabScreen]
class ReportTabRoute extends PageRouteInfo<void> {
  const ReportTabRoute({List<PageRouteInfo>? children})
      : super(
          ReportTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReportTabScreen();
    },
  );
}

/// generated route for
/// [StoragePermissionScreen]
class StoragePermissionRoute extends PageRouteInfo<void> {
  const StoragePermissionRoute({List<PageRouteInfo>? children})
      : super(
          StoragePermissionRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoragePermissionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StoragePermissionScreen();
    },
  );
}

/// generated route for
/// [UserTabScreen]
class UserTabRoute extends PageRouteInfo<void> {
  const UserTabRoute({List<PageRouteInfo>? children})
      : super(
          UserTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserTabScreen();
    },
  );
}
