import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/widgets/overlays/loader_overlay_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stacked/stacked.dart';

import 'scan_viewmodel.dart';

class ScanQRCodeView extends StackedView<ScanViewModel> {
  const ScanQRCodeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ScanViewModel viewModel,
    Widget? child,
  ) {
    return LoaderOverlayWrapper(
        type: viewModel.busy(loadingCardBusyKey) ? LoadingType.basic : null,
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

                    //   overlayColor: Colors.transparent,
                    borderColor: kcPrimaryColor,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300),
              ));
        });
  }

  @override
  ScanViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ScanViewModel();
}
