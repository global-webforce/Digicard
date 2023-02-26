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
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../views/_core/dashboard/dashboard_view.dart' as _i2;
import '../views/_core/login/auth_view.dart' as _i1;
import '../views/_core/login/login_view.dart' as _i4;
import '../views/_core/welcome/welcome_view.dart' as _i3;
import '../views/contacts/contacts_view.dart' as _i7;
import '../views/home/home_view.dart' as _i5;
import '../views/scan_qr_code/scan_qr_code_view.dart' as _i6;
import '../views/settings/settings_view.dart' as _i8;

class AppRoute extends _i9.RootStackRouter {
  AppRoute([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ScanQRCodeRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.ScanQRCodeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContactsRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.ContactsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.SettingsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          AuthRoute.name,
          path: '/',
          children: [
            _i9.RouteConfig(
              WelcomeRoute.name,
              path: '',
              parent: AuthRoute.name,
            ),
            _i9.RouteConfig(
              LoginRoute.name,
              path: '',
              parent: AuthRoute.name,
            ),
            _i9.RouteConfig(
              '*#redirect',
              path: '*',
              parent: AuthRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i9.RouteConfig(
          DashboardRoute.name,
          path: '/',
          children: [
            _i9.RouteConfig(
              HomeRoute.name,
              path: '',
              parent: DashboardRoute.name,
            ),
            _i9.RouteConfig(
              ScanQRCodeRoute.name,
              path: '',
              parent: DashboardRoute.name,
            ),
            _i9.RouteConfig(
              ContactsRoute.name,
              path: '',
              parent: DashboardRoute.name,
            ),
            _i9.RouteConfig(
              SettingsRoute.name,
              path: '',
              parent: DashboardRoute.name,
            ),
            _i9.RouteConfig(
              '*#redirect',
              path: '*',
              parent: DashboardRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.AuthView]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i2.DashboardView]
class DashboardRoute extends _i9.PageRouteInfo<void> {
  const DashboardRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i3.WelcomeView]
class WelcomeRoute extends _i9.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i4.LoginView]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.HomeView]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.ScanQRCodeView]
class ScanQRCodeRoute extends _i9.PageRouteInfo<void> {
  const ScanQRCodeRoute()
      : super(
          ScanQRCodeRoute.name,
          path: '',
        );

  static const String name = 'ScanQRCodeRoute';
}

/// generated route for
/// [_i7.ContactsView]
class ContactsRoute extends _i9.PageRouteInfo<void> {
  const ContactsRoute()
      : super(
          ContactsRoute.name,
          path: '',
        );

  static const String name = 'ContactsRoute';
}

/// generated route for
/// [_i8.SettingsView]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '',
        );

  static const String name = 'SettingsRoute';
}
