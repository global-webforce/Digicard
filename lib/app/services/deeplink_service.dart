import 'dart:async';

import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/helper/card_url_checker.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:uni_links/uni_links.dart';

import '../app.locator.dart';
import '../routes/app_router.dart';

class DeeplinkService with ListenableServiceMixin {
  final log = getLogger('DeeplinkService');
  final _navigationService = locator<AppRouter>();
  StreamSubscription? _streamSubscription;

  Future<void> initURIHandler() async {
    final Uri? uri = await getInitialUri();

    if (uri != null) {
      if (CardUrl(uri.toString()).isValid()) {
        _navigationService.push(CardDisplayRoute(
            action: DisplayType.private, uuid: CardUrl(uri.toString()).uuid));
      }
      log.d("Initial Deeplink: ${uri.toString()}");
    }
  }

  void incomingLinkHandler() {
    if (!kIsWeb) {
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        if (uri != null) {
          if (CardUrl(uri.toString()).isValid()) {
            if (_navigationService.topRoute.name == CardDisplayRoute.name) {
              _navigationService.popAndPush(CardDisplayRoute(
                  action: DisplayType.private,
                  uuid: CardUrl(uri.toString()).uuid));
            } else {
              _navigationService.push(CardDisplayRoute(
                  action: DisplayType.private,
                  uuid: CardUrl(uri.toString()).uuid));
            }
          }
          log.i("Stream Deeplink: ${uri.toString()}");
        }
      }, onError: (Object err) {});
    }
  }

  void dispose() {
    _streamSubscription?.cancel();
  }
}
