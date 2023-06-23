import 'dart:async';

import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/helper/card_url_checker.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/views/card_display/card_display_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:uni_links/uni_links.dart';

import '../app.locator.dart';
import '../routes/app_router.dart';

class DeeplinkService with ListenableServiceMixin {
  final log = getLogger('DeeplinkService');

  StreamSubscription? _streamSubscription;

  Future<void> initURIHandler() async {
    final navService = locator<AppRouter>();
    final String? initialLink = await getInitialLink();

    if (initialLink != null) {
      if (CardUrl(initialLink).isValid()) {
        navService.push(CardDisplayRoute(
            action: DisplayType.private, uuid: CardUrl(initialLink).uuid));
      }
    }
  }

  void incomingLinkHandler() {
    if (!kIsWeb) {
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        final navService = locator<AppRouter>();
        if (uri != null) {
          if (CardUrl(uri.toString()).isValid()) {
            if (navService.topRoute.name == CardDisplayRoute.name) {
              navService.popAndPush(CardDisplayRoute(
                  action: DisplayType.private,
                  uuid: CardUrl(uri.toString()).uuid));
            } else {
              navService.push(CardDisplayRoute(
                  action: DisplayType.private,
                  uuid: CardUrl(uri.toString()).uuid));
            }
          } else {}
        }
      }, onError: (Object err) {});
    }
  }

  void dispose() {
    _streamSubscription?.cancel();
  }
}
