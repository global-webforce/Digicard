import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/services/_core/user_service.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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
  final log = getLogger('AppRouter');
  late UserService userService;
  bool isAuthenticated = false;
  AppRouter({GlobalKey<NavigatorState>? navigatorKey})
      : super(navigatorKey: StackedService.navigatorKey) {
    userService = locator<UserService>();

    userService.addListener(() {
      isAuthenticated = userService.isPresent;
      notifyListeners();
    });
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    String routePath = resolver.route.path;
    if (["/welcome", "/login"].contains(routePath)) {
      if (isAuthenticated) {
        router.navigate(const InitialRoute());
      } else {
        resolver.next(true);
      }
    } else {
      resolver.next(true);
    }
    if (!kIsWeb) FlutterNativeSplash.remove();
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/",
          page: InitialRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: "/login",
          page: LoginRoute.page,
          keepHistory: false,
        ),
        AutoRoute(
          path: "/p/:id",
          page: CardWebRoute.page,
        ),
        RedirectRoute(path: "*", redirectTo: "/"),
      ];
}

class $AppRoute {}
