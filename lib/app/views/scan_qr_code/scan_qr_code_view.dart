import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/views/scan_qr_code/scan_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:stacked/stacked.dart';

class ScanQRCodeView extends StatelessWidget {
  const ScanQRCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScanViewModel>.reactive(
        viewModelBuilder: () => locator<ScanViewModel>(),
        disposeViewModel: false,
        createNewViewModelOnInsert: true,
        onViewModelReady: (viewModel) {},
        onDispose: (viewModel) {
          viewModel.controller?.dispose();
        },
        builder: (context, viewModel, child) {
          return Scaffold(body: _buildQrView(context));
        });
  }
}

Widget _buildQrView(BuildContext context) {
  final viewModel = getParentViewModel<ScanViewModel>(context);
  // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
  var scanArea = (MediaQuery.of(context).size.width < 400 ||
          MediaQuery.of(context).size.height < 400)
      ? 300.0
      : 300.0;
  // To ensure the Scanner view is properly sizes after rotation
  // we need to listen for Flutter SizeChanged notification and update viewModel.controller
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
          cutOutSize: scanArea),
    ),
  );
}
