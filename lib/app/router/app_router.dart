import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stackfood/app/router/nav_bar.dart';
import 'package:stackfood/core/global/widgets/error_screen.dart';
import 'package:stackfood/features/base/pages/splash_screen.dart';
import 'package:stackfood/features/home/presentation/home_screen/view/home_screen.dart';
import 'package:stackfood/features/random/favorite_screen.dart';
import 'package:stackfood/features/random/my_cart_screen.dart';
import 'package:stackfood/features/random/my_order_screen.dart';
import 'package:stackfood/features/random/user_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: '_rootNavigatorKey',
);

/// The default app router.
final GoRouter appRouter = GoRouter(
  initialLocation: '/${SplashScreen.routeName}',
  navigatorKey: _rootNavigatorKey,
  routes: [
    _buildSplashScreenRoute(),
    _buildErrorScreenRoute(),
    _buildShellRoutes(),
  ],
);

StatefulShellRoute _buildShellRoutes() {
  return StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(
        routes: [
          _buildHomeScreenRoute(),
        ],
      ),
      StatefulShellBranch(
        routes: [
          _buildFavoriteScreenRoute(),
        ],
      ),
      StatefulShellBranch(
        routes: [
          _buildMyCartRoute(),
        ],
      ),
      StatefulShellBranch(
        routes: [
          _buildMyOrderRoute(),
        ],
      ),
      StatefulShellBranch(
        routes: [
          _buildMyProfileRoute(),
        ],
      ),
    ],
  );
}

/// Clears all routes from the app router's stack and pushes the given
/// [path].
void clearAllRoutesAndGoToNamed(
  String path, {
  Object? extra,
}) {
  while (appRouter.canPop()) {
    appRouter.pop();
  }
  appRouter.pushReplacementNamed(
    path,
    extra: extra,
  );
}

GoRoute _buildSplashScreenRoute() => GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: SplashScreen.routeName,
      path: '/${SplashScreen.routeName}',
      pageBuilder: _getDefaultPageBuilderByPlatform(
        childBuilder: (_, __) => const SplashScreen(),
      ),
    );

GoRoute _buildHomeScreenRoute() => GoRoute(
      name: HomeScreen.routeName,
      path: '/${HomeScreen.routeName}',
      pageBuilder: _getDefaultPageBuilderByPlatform(
        childBuilder: (_, __) => const HomeScreen(),
      ),
    );

GoRoute _buildFavoriteScreenRoute() => GoRoute(
      path: FavoriteScreen.routeName,
      name: FavoriteScreen.routeName,
      pageBuilder: _getDefaultPageBuilderByPlatform(
        childBuilder: (_, __) => const FavoriteScreen(),
      ),
    );

GoRoute _buildErrorScreenRoute() => GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: ErrorScreen.routeName,
      path: '/${ErrorScreen.routeName}',
      pageBuilder: _getDefaultPageBuilderByPlatform(
        childBuilder: (_, __) => const ErrorScreen(),
      ),
    );

GoRoute _buildMyCartRoute() => GoRoute(
      path: MyCartScreen.routeName,
      name: MyCartScreen.routeName,
      pageBuilder: _getDefaultPageBuilderByPlatform(
        childBuilder: (_, __) => const MyCartScreen(),
      ),
    );

GoRoute _buildMyOrderRoute() => GoRoute(
      path: MyOrderScreen.routeName,
      name: MyOrderScreen.routeName,
      pageBuilder: _getDefaultPageBuilderByPlatform(
        childBuilder: (_, __) => const MyOrderScreen(),
      ),
    );

GoRoute _buildMyProfileRoute() => GoRoute(
      path: ProfileScreen.routeName,
      name: ProfileScreen.routeName,
      pageBuilder: _getDefaultPageBuilderByPlatform(
        childBuilder: (_, __) => const ProfileScreen(),
      ),
    );

/// /// /// Utility functions /// /// ///

Page<T> _getPageByPlatform<T>({required Widget child}) {
  if (kIsWeb) {
    return MaterialPage(child: child);
  } else {
    if (Platform.isAndroid) {
      return MaterialPage(child: child);
    }
    if (Platform.isIOS) {
      return CupertinoPage(child: child);
    }
    return MaterialPage(child: child);
  }
}

GoRouterPageBuilder _getDefaultPageBuilderByPlatform({
  required Widget Function(
    BuildContext context,
    GoRouterState goRouterState,
  ) childBuilder,
}) =>
    (context, goRouterState) => _getPageByPlatform(
          child: childBuilder(
            context,
            goRouterState,
          ),
        );
