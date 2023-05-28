// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:digicard/app/routes/app_router.dart' as _i1;
import 'package:digicard/app/routes/initial_view.dart' as _i2;
import 'package:digicard/app/views/_core/login/login_view.dart' as _i5;
import 'package:digicard/app/views/_core/login/password_reset_view.dart' as _i6;
import 'package:digicard/app/views/_core/welcome/welcome_view.dart' as _i7;
import 'package:digicard/app/views/card_open/card_open_view_web.dart' as _i3;
import 'package:digicard/app/views/dashboard/dashboard_view.dart' as _i4;
import 'package:flutter/material.dart' as _i9;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AuthWrapperRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthWrapperView(),
      );
    },
    InitialRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.InitialView(),
      );
    },
    CardWebRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CardWebRouteArgs>(
          orElse: () => CardWebRouteArgs(id: pathParams.optString('id')));
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CardWebView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DashboardView(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LoginView(
          key: args.key,
          onSuccessfulLogin: args.onSuccessfulLogin,
        ),
      );
    },
    PasswordResetRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PasswordResetView(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.WelcomeView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthWrapperView]
class AuthWrapperRoute extends _i8.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.InitialView]
class InitialRoute extends _i8.PageRouteInfo<void> {
  const InitialRoute({List<_i8.PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CardWebView]
class CardWebRoute extends _i8.PageRouteInfo<CardWebRouteArgs> {
  CardWebRoute({
    _i9.Key? key,
    String? id,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          CardWebRoute.name,
          args: CardWebRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'CardWebRoute';

  static const _i8.PageInfo<CardWebRouteArgs> page =
      _i8.PageInfo<CardWebRouteArgs>(name);
}

class CardWebRouteArgs {
  const CardWebRouteArgs({
    this.key,
    this.id,
  });

  final _i9.Key? key;

  final String? id;

  @override
  String toString() {
    return 'CardWebRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i4.DashboardView]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginView]
class LoginRoute extends _i8.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i9.Key? key,
    void Function(bool)? onSuccessfulLogin,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onSuccessfulLogin: onSuccessfulLogin,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<LoginRouteArgs> page =
      _i8.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.onSuccessfulLogin,
  });

  final _i9.Key? key;

  final void Function(bool)? onSuccessfulLogin;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onSuccessfulLogin: $onSuccessfulLogin}';
  }
}

/// generated route for
/// [_i6.PasswordResetView]
class PasswordResetRoute extends _i8.PageRouteInfo<void> {
  const PasswordResetRoute({List<_i8.PageRouteInfo>? children})
      : super(
          PasswordResetRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordResetRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.WelcomeView]
class WelcomeRoute extends _i8.PageRouteInfo<void> {
  const WelcomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
