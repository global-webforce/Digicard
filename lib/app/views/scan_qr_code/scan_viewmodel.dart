import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/views/card_open/card_open_view.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:digicard/app/views/scan_qr_code/scan_qr_code_view.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

const String loadingCardBusyKey = 'loadingCardBusyKey';

class ScanViewModel extends ReactiveViewModel {
  final log = getLogger('ScanViewModel');
  final _digicardService = locator<DigitalCardService>();
  final _navService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    {
      _dialogService.showCustomDialog(
          variant: DialogType.error,
          barrierDismissible: true,
          description: error.toString());
    }
    super.onFutureError(error, key);
  }

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool validUrlChecker(String val) {
    bool isValidUuid(String uuid) {
      final pattern = RegExp(
          r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-4[0-9a-fA-F]{3}-[89aAbB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$');
      return pattern.hasMatch(uuid);
    }

    try {
      var url = Uri.parse(val);
      var scheme = url.scheme; // 'https'
      var authority = url.authority; // 'www.digicard.me'
      var path = url.path; // '/abc123'
      var baseUrl = '$scheme://$authority/'; // 'https://www.digicard.me/'
      if (baseUrl == "https://www.digicard.me/" &&
          isValidUuid(path.substring(1))) {
        return true;
      }
      return false;
    } catch (e) {
      log.e("$val is not a valid url");
      return false;
    }
  }

  onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      try {
        result = scanData;
        log.d(result?.code);
        if (validUrlChecker("${result?.code}")) {
          var url = Uri.parse("${result?.code}");
          var uuid = url.path.substring(1);

          dynamic card;

          card = await runBusyFuture(_digicardService.findOne(uuid),
              busyObject: loadingCardBusyKey, throwException: true);

          if (card is DigitalCard) {
            _navService.popRepeated(1);
            await _navService.navigateToView(
                CardOpenView(card: card, actionType: ActionType.test));
          } else {
            await _dialogService
                .showCustomDialog(
                  variant: DialogType.simple,
                  title: "Card not found",
                  description:
                      "This card might be paused or deleted by the owner.",
                )
                .then((value) => controller.resumeCamera());
            // controller.resumeCamera();
          }
        }
      } catch (e) {
        rethrow;
      }

      /*      await _dialogService
          .showCustomDialog(
            variant: DialogType.simple,
            title: "SCAN RESULT",
            description: "${result?.code}",
          )
          .then((value) => controller.resumeCamera()); */

      notifyListeners();
    });
  }

  openScanner() {
    _navService.navigateToView(
        transitionStyle: Transition.noTransition, const ScanQRCodeView());
  }
}
