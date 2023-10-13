import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/ui/overlays/loader_overlay_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:stacked/stacked.dart';

import 'scan_viewmodel.dart';

class ScanQRCodeView extends StatelessWidget {
  const ScanQRCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScanViewModel>.reactive(
        viewModelBuilder: () => locator<ScanViewModel>(),
        disposeViewModel: false,
        onDispose: (viewModel) {
          viewModel.controller?.dispose();
        },
        builder: (context, viewModel, child) {
          return LoaderOverlayWrapper(
              type:
                  viewModel.busy(loadingCardBusyKey) ? LoadingType.basic : null,
              builder: (context) {
                return Scaffold(
                    extendBodyBehindAppBar: true,
                    appBar: AppBar(
                      leading: const BackButton(),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading: true,
                    ),
                    body: QRView(
                      key: viewModel.qrKey,
                      onQRViewCreated: (c) {
                        viewModel.onQRViewCreated(c);
                      },
                      overlay: QrScannerOverlayShape(
                          borderColor: kcPrimaryColor,
                          borderRadius: 10,
                          borderLength: 30,
                          borderWidth: 10,
                          cutOutSize: 200),
                    ));
              });
        });
  }
}
