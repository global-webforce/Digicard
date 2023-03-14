import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/views/scan_qr_code/scan_qr_code_view.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class ScanViewModel extends ReactiveViewModel {
  final log = getLogger('ScanViewModel');

  final _digitalCardsService = locator<DigitalCardService>();
  final _snackbarService = locator<SnackbarService>();
  final _navService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      result = scanData;
      controller.pauseCamera();
      await _dialogService
          .showCustomDialog(
            variant: DialogType.simple,
            title: "SCAN RESULT",
            description: "${result?.code}",
          )
          .then((value) => controller.resumeCamera());

      notifyListeners();
    });
  }

  openScanner() {
    _navService.navigateToView(
        transitionStyle: Transition.noTransition, const ScanQRCodeView());
  }
}
