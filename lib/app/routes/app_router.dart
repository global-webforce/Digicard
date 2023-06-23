import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app.locator.dart';

/*
NEVER EVER DO PARENT CHILDREN ON ROUTING - BIGGEST MISTAKE EVER
*/

@RoutePage(name: 'AuthWrapperRoute')
class AuthWrapperView extends AutoRouter {
  const AuthWrapperView({super.key});
}

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter implements AutoRouteGuard {
  final userService = locator<UserService>();
  AppRouter({GlobalKey<NavigatorState>? navigatorKey})
      : super(navigatorKey: StackedService.navigatorKey);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    String routePath = resolver.route.path;

    if (["/welcome", "/login"].contains(routePath)) {
      if (userService.isPresent) {
        router.navigate(const InitialRoute());
      } else {
        resolver.next(true);
      }
    } else {
      resolver.next(true);
    }
  }

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
            path: "/",
            page: InitialRoute.page,
            initial: true,
            transitionsBuilder: TransitionsBuilders.noTransition),
        AutoRoute(
          path: "/login",
          page: LoginRoute.page,
          keepHistory: false,
        ),
        AutoRoute(
          path: "/update-password",
          page: ForgotPasswordRoute.page,
          keepHistory: false,
        ),
        AutoRoute(
          path: "/p/:uuid",
          page: CardDisplayRoute.page,
        ),
        RedirectRoute(path: "*", redirectTo: "/"),
      ];
}

class $AppRoute {}
