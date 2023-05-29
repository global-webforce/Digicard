import 'dart:async';

import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:flutter/foundation.dart';
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

    if (initialLink != null && initialLink != '/') {
      var uri = Uri.parse(initialLink);
      var pathSegments = uri.fragment.split('/');
      if (pathSegments.length >= 3) {
        if (pathSegments[1] == "p") {
          _navService.push(CardWebRoute(id: pathSegments[2]));
        }
      }
    }
  }

  void incomingLinkHandler() {
    if (!kIsWeb) {
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        if (uri != null) {
          var pathSegments = uri.fragment.split('/');

          if (pathSegments.length >= 3) {
            if (pathSegments[1] == "p") {
              _navService.push(CardWebRoute(id: pathSegments[2]));
            }
          }
        }
      }, onError: (Object err) {});
    }
  }

  void dispose() {
    _streamSubscription?.cancel();
  }
}
