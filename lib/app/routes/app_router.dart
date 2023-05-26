import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/routes/app_router.gr.dart';

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app.locator.dart';
import '../services/_core/user_service.dart';

/*
NEVER EVER DO PARENT CHILDREN ON ROUTING - BIGGEST MISTAKE EVER
*/

@RoutePage(name: 'AuthWrapperRoute')
class AuthWrapperView extends AutoRouter {
  const AuthWrapperView({super.key});
}

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter implements AutoRouteGuard {
  final log = getLogger('AppRouter');
  AppRouter({GlobalKey<NavigatorState>? navigatorKey})
      : super(navigatorKey: StackedService.navigatorKey);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final normalStart = resolver.pendingRoutes.isEmpty;
    String routeName = "";
    routeName = resolver.route.name;
    log.i("\nRoute: $routeName\nPending Routes: ${resolver.pendingRoutes}");

    final user = locator<UserService>();

    if (routeName == "DashboardRoute") {
      if (user.isPresent) {
        resolver.next(user.isPresent);
      } else {
        log.e("Not Authenticated");
        router.navigate(const WelcomeRoute());
      }
    } else {
      resolver.next(true);
    }
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/welcome",
          page: WelcomeRoute.page,
          keepHistory: false,
        ),
        AutoRoute(
          path: "/login",
          page: LoginRoute.page,
          keepHistory: false,
        ),
        AutoRoute(
          path: "/",
          page: DashboardRoute.page,
        ),
        AutoRoute(
          path: "/p/:id",
          page: CardWebRoute.page,
        ),
        RedirectRoute(path: "*", redirectTo: ""),
      ];
}

class $AppRoute {}
