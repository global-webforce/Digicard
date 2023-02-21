import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/core/authentication/pages/register_page.dart';
import 'package:digicard/features/contacts/contacts_page.dart';
import 'package:digicard/app/core/authentication/pages/auth_page.dart';
import 'package:digicard/app/core/authentication/pages/login_page.dart';
import 'package:digicard/app/core/authentication/pages/welcome_page.dart';
import 'package:digicard/dashboards/user_dashboard/pages/home_page.dart';
import 'package:digicard/dashboards/user_dashboard/pages/scaffold_page.dart';
import 'package:digicard/features/scan/scan_page.dart';
import 'package:digicard/features/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';

class HeroEmptyRouterPage extends StatelessWidget {
  const HeroEmptyRouterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HeroControllerScope(
      controller: HeroController(),
      child: const AutoRouter(),
    );
  }
}

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  CustomRoute(
    path: '/',
    page: AuthPage,
    transitionsBuilder: TransitionsBuilders.fadeIn,
    children: [
      CustomRoute(
        page: WelcomePage,
        initial: true,
        transitionsBuilder: TransitionsBuilders.zoomIn,
      ),
      CustomRoute(
        path: 'login',
        page: LoginPage,
        transitionsBuilder: TransitionsBuilders.zoomIn,
      ),
      CustomRoute(
        path: "register",
        page: RegisterPage,
        transitionsBuilder: TransitionsBuilders.zoomIn,
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  ),
  CustomRoute(
    path: "/",
    page: ScaffoldPage,
    children: [
      CustomRoute(
        initial: true,
        page: HomePage,
        maintainState: false,
        meta: {
          'prefixPath': 'home',
        },
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        initial: true,
        path: "",
        page: ScanPage,
        maintainState: false,
        meta: {
          'prefixPath': 'appointments',
        },
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        initial: true,
        path: "",
        page: ContactsPage,
        maintainState: false,
        meta: {
          'prefixPath': 'chat',
        },
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        path: "",
        page: SettingsPage,
        maintainState: false,
        meta: {
          'prefixPath': 'settings',
        },
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  ),
])
class $AppRoute {}
