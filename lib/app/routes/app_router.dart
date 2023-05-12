import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/routes/app_router.gr.dart';

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class HeroEmptyRouterPage extends StatelessWidget {
  const HeroEmptyRouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HeroControllerScope(
      controller: HeroController(),
      child: const AutoRouter(),
    );
  }
}

/*
NEVER EVER DO PARENT CHILDREN ON ROUTING - BIGGEST MISTAKE EVER
*/
@RoutePage()
class AuthView extends AutoRouter {
  const AuthView({super.key});
}

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  AppRouter({GlobalKey<NavigatorState>? navigatorKey})
      : super(navigatorKey: StackedService.navigatorKey);
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          path: '/',
          page: AuthRoute.page,
          children: [
            CustomRoute(
              path: '',
              page: WelcomeRoute.page,
            ),
            CustomRoute(
              path: '',
              page: LoginRoute.page,
            ),
          ],
        ),
        CustomRoute(
          path: "/",
          page: DashboardRoute.page,
        ),
        RedirectRoute(path: '*', redirectTo: ''),
      ];
}

class $AppRoute {}
