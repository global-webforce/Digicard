import 'package:digicard/app/app.dialogs.dart';
import 'package:digicard/app/app.router.dart';
import 'package:digicard/app/app.logger.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'scan_qr_code_view.dart';

class ScanViewModel extends ReactiveViewModel {
  final log = getLogger('ScanViewModel');
  final _navigationService = locator<RouterService>();
  final _dialogService = locator<DialogService>();
  @override
  Future<void> onFutureError(error, Object? key) async {
    log.e(error);

    await _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    controller?.resumeCamera();

    super.onFutureError(error, key);
  }

  PermissionStatus? status;
  Barcode? result;

  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Future openScanner() async {
    if (!kIsWeb) {
      status = await Permission.camera.status;

      if (status?.isGranted == false) {
        await _dialogService
            .showCustomDialog(
                variant: DialogType.confirm,
                title: 'Permisson Denied',
                description:
                    'To scan QR Code, authorize Digicard to access camera from App Settings.',
                mainButtonTitle: 'Open Settings')
            .then((value) {
          if (value?.confirmed ?? false) {
            openAppSettings();
          }
        });
      } else {
        await _navigationService.navigateWithTransition(const ScanQRCodeView());
      }
    } else {
      await _navigationService.navigateWithTransition(const ScanQRCodeView());
    }
  }

  onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      try {
        result = scanData;

        controller.pauseCamera();

        await _navigationService.navigateToCardViewerWebView(
            uuid: result?.code.toString());
      } catch (e) {
        rethrow;
      } finally {
        controller.resumeCamera();
      }

      notifyListeners();
    });
  }
}
