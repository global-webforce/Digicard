import 'dart:async';

import 'package:digicard/app/app.logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uni_links/uni_links.dart';

import '../app.locator.dart';

class DeeplinkService with ListenableServiceMixin {
  final log = getLogger('DeeplinkService');
  final _dialogService = locator<DialogService>();

  bool _initialURILinkHandled = false;

  Future<void> initURIHandler() async {
    // 1
    if (!_initialURILinkHandled) {
      _initialURILinkHandled = true;
      // 2
      log.i("Deeplink executed");
      try {
        // 3
        final initialURI = await getInitialUri();
        // 4
        if (initialURI != null) {
          _dialogService.showDialog(title: initialURI.toString());
        } else {
          debugPrint("Null Initial URI received");
        }
      } on PlatformException {
        // 5
        debugPrint("Failed to receive initial uri");
      } on FormatException catch (err) {
        _dialogService.showDialog(title: err.toString());
      }
    }
  }

  void incomingLinkHandler() {
    if (!kIsWeb) {
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      uriLinkStream.listen((Uri? uri) {
        _dialogService.showDialog(title: uri.toString());
      }, onError: (Object err) {
        _dialogService.showDialog(title: err.toString());
      });
    }
  }
}
