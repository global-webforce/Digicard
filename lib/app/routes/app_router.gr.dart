// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:digicard/app/models/digital_card.dart' as _i11;
import 'package:digicard/app/routes/app_router.dart' as _i1;
import 'package:digicard/app/routes/initial_view.dart' as _i2;
import 'package:digicard/app/views/_core/login/forgot_password_view.dart'
    as _i5;
import 'package:digicard/app/views/_core/login/login_view.dart' as _i6;
import 'package:digicard/app/views/_core/login/password_reset_view.dart' as _i7;
import 'package:digicard/app/views/_core/welcome/welcome_view.dart' as _i8;
import 'package:digicard/app/views/card_display/card_display_view1.dart' as _i3;
import 'package:digicard/app/views/card_display/card_display_viewmodel.dart'
    as _i12;
import 'package:digicard/app/views/dashboard/dashboard_view.dart' as _i4;
import 'package:flutter/foundation.dart' as _i10;
import 'package:flutter/material.dart' as _i13;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AuthWrapperRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthWrapperView(),
      );
    },
    InitialRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.InitialView(),
      );
    },
    CardDisplayRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CardDisplayRouteArgs>(
          orElse: () =>
              CardDisplayRouteArgs(uuid: pathParams.optString('uuid')));
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CardDisplayView(
          key: args.key,
          uuid: args.uuid,
          card: args.card,
          action: args.action,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DashboardView(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ForgotPasswordView(
          key: args.key,
          onSuccessfulLogin: args.onSuccessfulLogin,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LoginView(
          key: args.key,
          onSuccessfulLogin: args.onSuccessfulLogin,
        ),
      );
    },
    PasswordResetRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PasswordResetView(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.WelcomeView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthWrapperView]
class AuthWrapperRoute extends _i9.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.InitialView]
class InitialRoute extends _i9.PageRouteInfo<void> {
  const InitialRoute({List<_i9.PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CardDisplayView]
class CardDisplayRoute extends _i9.PageRouteInfo<CardDisplayRouteArgs> {
  CardDisplayRoute({
    _i10.Key? key,
    String? uuid,
    _i11.DigitalCard? card,
    _i12.DisplayType? action,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CardDisplayRoute.name,
          args: CardDisplayRouteArgs(
            key: key,
            uuid: uuid,
            card: card,
            action: action,
          ),
          rawPathParams: {'uuid': uuid},
          initialChildren: children,
        );

  static const String name = 'CardDisplayRoute';

  static const _i9.PageInfo<CardDisplayRouteArgs> page =
      _i9.PageInfo<CardDisplayRouteArgs>(name);
}

class CardDisplayRouteArgs {
  const CardDisplayRouteArgs({
    this.key,
    this.uuid,
    this.card,
    this.action,
  });

  final _i10.Key? key;

  final String? uuid;

  final _i11.DigitalCard? card;

  final _i12.DisplayType? action;

  @override
  String toString() {
    return 'CardDisplayRouteArgs{key: $key, uuid: $uuid, card: $card, action: $action}';
  }
}

/// generated route for
/// [_i4.DashboardView]
class DashboardRoute extends _i9.PageRouteInfo<void> {
  const DashboardRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ForgotPasswordView]
class ForgotPasswordRoute extends _i9.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    _i13.Key? key,
    void Function(bool)? onSuccessfulLogin,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordRoute.name,
          args: ForgotPasswordRouteArgs(
            key: key,
            onSuccessfulLogin: onSuccessfulLogin,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i9.PageInfo<ForgotPasswordRouteArgs> page =
      _i9.PageInfo<ForgotPasswordRouteArgs>(name);
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({
    this.key,
    this.onSuccessfulLogin,
  });

  final _i13.Key? key;

  final void Function(bool)? onSuccessfulLogin;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key, onSuccessfulLogin: $onSuccessfulLogin}';
  }
}

/// generated route for
/// [_i6.LoginView]
class LoginRoute extends _i9.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i13.Key? key,
    void Function(bool)? onSuccessfulLogin,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onSuccessfulLogin: onSuccessfulLogin,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<LoginRouteArgs> page =
      _i9.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.onSuccessfulLogin,
  });

  final _i13.Key? key;

  final void Function(bool)? onSuccessfulLogin;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onSuccessfulLogin: $onSuccessfulLogin}';
  }
}

/// generated route for
/// [_i7.PasswordResetView]
class PasswordResetRoute extends _i9.PageRouteInfo<void> {
  const PasswordResetRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PasswordResetRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordResetRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.WelcomeView]
class WelcomeRoute extends _i9.PageRouteInfo<void> {
  const WelcomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
