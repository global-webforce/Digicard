import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/services/_core/user_service.dart';

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

@RoutePage(name: 'RootRouter')
class RootView extends AutoRouter {
  const RootView({super.key});
}

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  AppRouter({GlobalKey<NavigatorState>? navigatorKey})
      : super(navigatorKey: StackedService.navigatorKey);
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          path: "/",
          page: WelcomeRoute.page,
          keepHistory: false,
        ),
        CustomRoute(
          path: "/",
          page: LoginRoute.page,
          keepHistory: false,
        ),
        AutoRoute(
          page: RootRouter.page,
          path: "/",
          guards: [
            AutoRouteGuard.simple((resolver, router) async {
              final x = locator<UserService>();
              if (x.isPresent) {
                resolver.next();
              } else {
                navigate(const LoginRoute());
              }
            })
          ],
          children: [
            CustomRoute(
              path: "",
              page: DashboardRoute.page,
            ),
            CustomRoute(
              path: "p/:id",
              page: CardWebRoute.page,
              fullMatch: true,
            ),
          ],
        ),
        RedirectRoute(path: '*', redirectTo: ''),
      ];
}

class $AppRoute {}
