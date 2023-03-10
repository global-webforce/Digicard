import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/views/_core/login/auth_view.dart';
import 'package:digicard/app/views/_core/login/login_view.dart';
import 'package:digicard/app/views/_core/welcome/welcome_view.dart';

import 'package:flutter/material.dart';

import '../views/_core/dashboard/dashboard_view_stacked.dart';

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

@MaterialAutoRouter(replaceInRouteName: 'View,Route', routes: [
  CustomRoute(
    path: '/',
    page: AuthView,
    children: [
      CustomRoute(
        initial: true,
        path: '',
        page: WelcomeView,
      ),
      CustomRoute(
        path: '',
        page: LoginView,
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  ),
  CustomRoute(
    path: "/",
    page: DashboardView,
/*     children: [
      CustomRoute(
        initial: true,
        page: HomeView,
      ),
      CustomRoute(
        path: '',
        page: ScanQRCodeView,
      ),
      CustomRoute(
        path: '',
        page: ContactsView,
      ),
      CustomRoute(
        path: '',
        page: SettingsView,
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ], */
  ),
])
class $AppRoute {}
