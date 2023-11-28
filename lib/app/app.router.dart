// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i14;
import 'package:stacked/stacked.dart' as _i13;
import 'package:stacked_services/stacked_services.dart' as _i12;

import '../ui/views/auth/auth_view.dart' as _i3;
import '../ui/views/card_editor/card_editor_view.dart' as _i8;
import '../ui/views/card_viewer/card_viewer_view.dart' as _i9;
import '../ui/views/card_viewer_web/card_viewer_web_view.dart' as _i2;
import '../ui/views/contacts/contacts_view.dart' as _i5;
import '../ui/views/dashboard/dashboard_view.dart' as _i11;
import '../ui/views/forgot_password/forgot_password_view.dart' as _i10;
import '../ui/views/home/home_view.dart' as _i4;
import '../ui/views/scan/scan_view.dart' as _i7;
import '../ui/views/settings/settings_view.dart' as _i6;
import '../ui/views/startup/startup_view.dart' as _i1;
import 'constants/stacked_keys.dart' as _i16;
import 'models/digital_card_dto.dart' as _i15;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i12.StackedService.navigatorKey);

class StackedRouterWeb extends _i13.RootStackRouter {
  StackedRouterWeb({_i14.GlobalKey<_i14.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
      );
    },
    CardViewerWebViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CardViewerWebViewArgs>(
          orElse: () =>
              CardViewerWebViewArgs(uuid: pathParams.optString('uuid')));
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.CardViewerWebView(
          uuid: args.uuid,
          key: args.key,
        ),
      );
    },
    AuthViewRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AuthView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeView(),
        transitionsBuilder: _i13.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContactsViewRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.ContactsView(),
        transitionsBuilder: _i13.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsViewRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.SettingsView(),
        transitionsBuilder: _i13.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ScanViewRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.ScanView(),
        maintainState: false,
        transitionsBuilder: _i13.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CardEditorViewRoute.name: (routeData) {
      final args = routeData.argsAs<CardEditorViewArgs>(
          orElse: () => const CardEditorViewArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.CardEditorView(
          key: args.key,
          card: args.card,
          actionType: args.actionType,
        ),
      );
    },
    CardViewerViewRoute.name: (routeData) {
      final args = routeData.argsAs<CardViewerViewArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.CardViewerView(
          card: args.card,
          mode: args.mode,
          key: args.key,
        ),
      );
    },
    ForgotPasswordViewRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordViewArgs>(
          orElse: () => const ForgotPasswordViewArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.ForgotPasswordView(
          key: args.key,
          fromLink: args.fromLink,
        ),
      );
    },
    DashboardViewRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.DashboardView(),
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i13.RouteConfig(
          CardViewerWebViewRoute.name,
          path: '/p/:uuid',
          fullMatch: true,
        ),
        _i13.RouteConfig(
          AuthViewRoute.name,
          path: '/auth-view',
        ),
        _i13.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i13.RouteConfig(
          ContactsViewRoute.name,
          path: '/contacts-view',
        ),
        _i13.RouteConfig(
          SettingsViewRoute.name,
          path: '/settings-view',
        ),
        _i13.RouteConfig(
          ScanViewRoute.name,
          path: '/scan-view',
        ),
        _i13.RouteConfig(
          CardEditorViewRoute.name,
          path: '/card-editor-view',
        ),
        _i13.RouteConfig(
          CardViewerViewRoute.name,
          path: '/card-viewer-view',
        ),
        _i13.RouteConfig(
          ForgotPasswordViewRoute.name,
          path: '/forgot-password-view',
        ),
        _i13.RouteConfig(
          DashboardViewRoute.name,
          path: '/dashboard-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i13.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.CardViewerWebView]
class CardViewerWebViewRoute extends _i13.PageRouteInfo<CardViewerWebViewArgs> {
  CardViewerWebViewRoute({
    String? uuid,
    _i14.Key? key,
  }) : super(
          CardViewerWebViewRoute.name,
          path: '/p/:uuid',
          args: CardViewerWebViewArgs(
            uuid: uuid,
            key: key,
          ),
          rawPathParams: {'uuid': uuid},
        );

  static const String name = 'CardViewerWebView';
}

class CardViewerWebViewArgs {
  const CardViewerWebViewArgs({
    this.uuid,
    this.key,
  });

  final String? uuid;

  final _i14.Key? key;

  @override
  String toString() {
    return 'CardViewerWebViewArgs{uuid: $uuid, key: $key}';
  }
}

/// generated route for
/// [_i3.AuthView]
class AuthViewRoute extends _i13.PageRouteInfo<void> {
  const AuthViewRoute()
      : super(
          AuthViewRoute.name,
          path: '/auth-view',
        );

  static const String name = 'AuthView';
}

/// generated route for
/// [_i4.HomeView]
class HomeViewRoute extends _i13.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i5.ContactsView]
class ContactsViewRoute extends _i13.PageRouteInfo<void> {
  const ContactsViewRoute()
      : super(
          ContactsViewRoute.name,
          path: '/contacts-view',
        );

  static const String name = 'ContactsView';
}

/// generated route for
/// [_i6.SettingsView]
class SettingsViewRoute extends _i13.PageRouteInfo<void> {
  const SettingsViewRoute()
      : super(
          SettingsViewRoute.name,
          path: '/settings-view',
        );

  static const String name = 'SettingsView';
}

/// generated route for
/// [_i7.ScanView]
class ScanViewRoute extends _i13.PageRouteInfo<void> {
  const ScanViewRoute()
      : super(
          ScanViewRoute.name,
          path: '/scan-view',
        );

  static const String name = 'ScanView';
}

/// generated route for
/// [_i8.CardEditorView]
class CardEditorViewRoute extends _i13.PageRouteInfo<CardEditorViewArgs> {
  CardEditorViewRoute({
    _i14.Key? key,
    _i15.DigitalCardDTO? card,
    _i16.ActionType? actionType,
  }) : super(
          CardEditorViewRoute.name,
          path: '/card-editor-view',
          args: CardEditorViewArgs(
            key: key,
            card: card,
            actionType: actionType,
          ),
        );

  static const String name = 'CardEditorView';
}

class CardEditorViewArgs {
  const CardEditorViewArgs({
    this.key,
    this.card,
    this.actionType,
  });

  final _i14.Key? key;

  final _i15.DigitalCardDTO? card;

  final _i16.ActionType? actionType;

  @override
  String toString() {
    return 'CardEditorViewArgs{key: $key, card: $card, actionType: $actionType}';
  }
}

/// generated route for
/// [_i9.CardViewerView]
class CardViewerViewRoute extends _i13.PageRouteInfo<CardViewerViewArgs> {
  CardViewerViewRoute({
    _i15.DigitalCardDTO? card,
    required _i16.DisplayMode mode,
    _i14.Key? key,
  }) : super(
          CardViewerViewRoute.name,
          path: '/card-viewer-view',
          args: CardViewerViewArgs(
            card: card,
            mode: mode,
            key: key,
          ),
        );

  static const String name = 'CardViewerView';
}

class CardViewerViewArgs {
  const CardViewerViewArgs({
    this.card,
    required this.mode,
    this.key,
  });

  final _i15.DigitalCardDTO? card;

  final _i16.DisplayMode mode;

  final _i14.Key? key;

  @override
  String toString() {
    return 'CardViewerViewArgs{card: $card, mode: $mode, key: $key}';
  }
}

/// generated route for
/// [_i10.ForgotPasswordView]
class ForgotPasswordViewRoute
    extends _i13.PageRouteInfo<ForgotPasswordViewArgs> {
  ForgotPasswordViewRoute({
    _i14.Key? key,
    bool fromLink = false,
  }) : super(
          ForgotPasswordViewRoute.name,
          path: '/forgot-password-view',
          args: ForgotPasswordViewArgs(
            key: key,
            fromLink: fromLink,
          ),
        );

  static const String name = 'ForgotPasswordView';
}

class ForgotPasswordViewArgs {
  const ForgotPasswordViewArgs({
    this.key,
    this.fromLink = false,
  });

  final _i14.Key? key;

  final bool fromLink;

  @override
  String toString() {
    return 'ForgotPasswordViewArgs{key: $key, fromLink: $fromLink}';
  }
}

/// generated route for
/// [_i11.DashboardView]
class DashboardViewRoute extends _i13.PageRouteInfo<void> {
  const DashboardViewRoute()
      : super(
          DashboardViewRoute.name,
          path: '/dashboard-view',
        );

  static const String name = 'DashboardView';
}

extension RouterStateExtension on _i12.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCardViewerWebView({
    String? uuid,
    _i14.Key? key,
    void Function(_i13.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CardViewerWebViewRoute(
        uuid: uuid,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAuthView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AuthViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToContactsView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ContactsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToSettingsView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const SettingsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToScanView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ScanViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCardEditorView({
    _i14.Key? key,
    _i15.DigitalCardDTO? card,
    _i16.ActionType? actionType,
    void Function(_i13.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CardEditorViewRoute(
        key: key,
        card: card,
        actionType: actionType,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCardViewerView({
    _i15.DigitalCardDTO? card,
    required _i16.DisplayMode mode,
    _i14.Key? key,
    void Function(_i13.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CardViewerViewRoute(
        card: card,
        mode: mode,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToForgotPasswordView({
    _i14.Key? key,
    bool fromLink = false,
    void Function(_i13.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      ForgotPasswordViewRoute(
        key: key,
        fromLink: fromLink,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToDashboardView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCardViewerWebView({
    String? uuid,
    _i14.Key? key,
    void Function(_i13.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CardViewerWebViewRoute(
        uuid: uuid,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAuthView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AuthViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithContactsView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ContactsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithSettingsView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const SettingsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithScanView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ScanViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCardEditorView({
    _i14.Key? key,
    _i15.DigitalCardDTO? card,
    _i16.ActionType? actionType,
    void Function(_i13.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CardEditorViewRoute(
        key: key,
        card: card,
        actionType: actionType,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCardViewerView({
    _i15.DigitalCardDTO? card,
    required _i16.DisplayMode mode,
    _i14.Key? key,
    void Function(_i13.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CardViewerViewRoute(
        card: card,
        mode: mode,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithForgotPasswordView({
    _i14.Key? key,
    bool fromLink = false,
    void Function(_i13.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      ForgotPasswordViewRoute(
        key: key,
        fromLink: fromLink,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithDashboardView(
      {void Function(_i13.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }
}
