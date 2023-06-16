import 'dart:async';

import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/helper/card_url_checker.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/views/card_display/card_display_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uni_links/uni_links.dart';

import '../app.locator.dart';
import '../routes/app_router.dart';

class DeeplinkService with ListenableServiceMixin {
  final log = getLogger('DeeplinkService');

  final _navService = locator<AppRouter>();

  StreamSubscription? _streamSubscription;

  Future<void> initURIHandler() async {
    final String? initialLink = await getInitialLink();

    if (initialLink != null) {
      if (CardUrl(initialLink).isValid()) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _navService.push(CardDisplayRoute(
              action: DisplayType.private, uuid: CardUrl(initialLink).uuid));
        });
      }
    }
  }

  void incomingLinkHandler() {
    if (!kIsWeb) {
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        if (uri != null) {
          if (CardUrl(uri.toString()).isValid()) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _navService.push(CardDisplayRoute(
                  action: DisplayType.private,
                  uuid: CardUrl(uri.toString()).uuid));
            });
          }
        }
      }, onError: (Object err) {});
    }
  }

  void dispose() {
    _streamSubscription?.cancel();
  }
}
