// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../../dashboards/user_dashboard/pages/home_page.dart' as _i6;
import '../../dashboards/user_dashboard/pages/scaffold_page.dart' as _i2;
import '../../features/contacts/contacts_page.dart' as _i8;
import '../../features/scan/scan_page.dart' as _i7;
import '../../features/settings/pages/settings_page.dart' as _i9;
import '../core/authentication/pages/auth_page.dart' as _i1;
import '../core/authentication/pages/login_page.dart' as _i4;
import '../core/authentication/pages/register_page.dart' as _i5;
import '../core/authentication/pages/welcome_page.dart' as _i3;

class AppRoute extends _i10.RootStackRouter {
  AppRoute([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.AuthPage(key: args.key),
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ScaffoldRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.ScaffoldPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomePage(),
        transitionsBuilder: _i10.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
        transitionsBuilder: _i10.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterPage(),
        transitionsBuilder: _i10.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
        maintainState: false,
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ScanRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.ScanPage(),
        maintainState: false,
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContactsRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.ContactsPage(),
        maintainState: false,
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.SettingsPage(),
        maintainState: false,
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          AuthRoute.name,
          path: '/',
          children: [
            _i10.RouteConfig(
              WelcomeRoute.name,
              path: '',
              parent: AuthRoute.name,
            ),
            _i10.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthRoute.name,
            ),
            _i10.RouteConfig(
              RegisterRoute.name,
              path: 'register',
              parent: AuthRoute.name,
            ),
            _i10.RouteConfig(
              '*#redirect',
              path: '*',
              parent: AuthRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i10.RouteConfig(
          ScaffoldRoute.name,
          path: '/',
          children: [
            _i10.RouteConfig(
              HomeRoute.name,
              path: '',
              parent: ScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'home'},
            ),
            _i10.RouteConfig(
              ScanRoute.name,
              path: '',
              parent: ScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'appointments'},
            ),
            _i10.RouteConfig(
              ContactsRoute.name,
              path: '',
              parent: ScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'chat'},
            ),
            _i10.RouteConfig(
              SettingsRoute.name,
              path: '',
              parent: ScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'settings'},
            ),
            _i10.RouteConfig(
              '*#redirect',
              path: '*',
              parent: ScaffoldRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i10.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          path: '/',
          args: AuthRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';
}

class AuthRouteArgs {
  const AuthRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.ScaffoldPage]
class ScaffoldRoute extends _i10.PageRouteInfo<void> {
  const ScaffoldRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ScaffoldRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'ScaffoldRoute';
}

/// generated route for
/// [_i3.WelcomePage]
class WelcomeRoute extends _i10.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.RegisterPage]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.ScanPage]
class ScanRoute extends _i10.PageRouteInfo<void> {
  const ScanRoute()
      : super(
          ScanRoute.name,
          path: '',
        );

  static const String name = 'ScanRoute';
}

/// generated route for
/// [_i8.ContactsPage]
class ContactsRoute extends _i10.PageRouteInfo<void> {
  const ContactsRoute()
      : super(
          ContactsRoute.name,
          path: '',
        );

  static const String name = 'ContactsRoute';
}

/// generated route for
/// [_i9.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '',
        );

  static const String name = 'SettingsRoute';
}
