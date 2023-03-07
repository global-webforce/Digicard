import 'dart:io';
import 'dart:ui' as ui;

import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/app.bottomsheet_ui.dart';

import 'package:digicard/app/services/digital_card_service.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class CardSendBottomSheetViewModel extends ReactiveViewModel {
  final log = getLogger('CardSendBottomSheetViewModel');
  final _bottomSheetService = locator<BottomSheetService>();

  final _digitalCardsService = locator<DigitalCardService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardsService];

  GlobalKey globalKey = GlobalKey();

  List<DigitalCard> get digitalCards => _digitalCardsService.digitalCards;

  show() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.send,
      isScrollControlled: true,
    );
  }

  Future<void> captureAndSharePng() async {
    try {
      final RenderRepaintBoundary boundary = globalKey.currentContext!
          .findRenderObject()! as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage(pixelRatio: 10.0);
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);
      XFile filex = XFile(file.path);
      Share.shareXFiles([filex]);

      print("CAPTURED");
    } catch (e) {
      print(e.toString());
    }
  }

  //https://github.com/flutter/flutter/issues/40064

  //https://medium.com/flutter-community/building-flutter-qr-code-generator-scanner-and-sharing-app-703e73b228d3
}
