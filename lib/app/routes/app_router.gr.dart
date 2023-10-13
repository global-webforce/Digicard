// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:digicard/app/constants/keys.dart' as _i11;
import 'package:digicard/app/models/digital_card.dart' as _i10;
import 'package:digicard/app/routes/app_router.dart' as _i1;
import 'package:digicard/app/routes/initial_view.dart' as _i2;
import 'package:digicard/app/views/00_startup_login/forgot_password_view.dart'
    as _i3;
import 'package:digicard/app/views/00_startup_login/login_view.dart' as _i4;
import 'package:digicard/app/views/00_startup_login/password_reset_view.dart'
    as _i5;
import 'package:digicard/app/views/06_card_viewer/card_display_view.dart'
    as _i6;
import 'package:digicard/app/views/dashboard/dashboard_view.dart' as _i7;
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
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ForgotPasswordView(
          key: args.key,
          fromLink: args.fromLink,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LoginView(
          key: args.key,
          onSuccessfulLogin: args.onSuccessfulLogin,
        ),
      );
    },
    PasswordResetRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PasswordResetView(),
      );
    },
    CardDisplayRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CardDisplayRouteArgs>(
          orElse: () =>
              CardDisplayRouteArgs(uuid: pathParams.optString('uuid')));
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.CardDisplayView(
          key: args.key,
          uuid: args.uuid,
          card: args.card,
          displayType: args.displayType,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.DashboardView(),
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
/// [_i3.ForgotPasswordView]
class ForgotPasswordRoute extends _i8.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    _i9.Key? key,
    bool fromLink = false,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordRoute.name,
          args: ForgotPasswordRouteArgs(
            key: key,
            fromLink: fromLink,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i8.PageInfo<ForgotPasswordRouteArgs> page =
      _i8.PageInfo<ForgotPasswordRouteArgs>(name);
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({
    this.key,
    this.fromLink = false,
  });

  final _i9.Key? key;

  final bool fromLink;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key, fromLink: $fromLink}';
  }
}

/// generated route for
/// [_i4.LoginView]
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
/// [_i5.PasswordResetView]
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
/// [_i6.CardDisplayView]
class CardDisplayRoute extends _i8.PageRouteInfo<CardDisplayRouteArgs> {
  CardDisplayRoute({
    _i9.Key? key,
    String? uuid,
    _i10.DigitalCard? card,
    _i11.DisplayType? displayType,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          CardDisplayRoute.name,
          args: CardDisplayRouteArgs(
            key: key,
            uuid: uuid,
            card: card,
            displayType: displayType,
          ),
          rawPathParams: {'uuid': uuid},
          initialChildren: children,
        );

  static const String name = 'CardDisplayRoute';

  static const _i8.PageInfo<CardDisplayRouteArgs> page =
      _i8.PageInfo<CardDisplayRouteArgs>(name);
}

class CardDisplayRouteArgs {
  const CardDisplayRouteArgs({
    this.key,
    this.uuid,
    this.card,
    this.displayType,
  });

  final _i9.Key? key;

  final String? uuid;

  final _i10.DigitalCard? card;

  final _i11.DisplayType? displayType;

  @override
  String toString() {
    return 'CardDisplayRouteArgs{key: $key, uuid: $uuid, card: $card, displayType: $displayType}';
  }
}

/// generated route for
/// [_i7.DashboardView]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
