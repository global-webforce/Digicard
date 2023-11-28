import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/views/dashboard/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/flutter_ez_core.dart';
import 'package:stacked/stacked.dart';
import 'scan_viewmodel.dart';

class ScanView extends StackedView<ScanViewModel> {
  const ScanView({Key? key}) : super(key: key);

  @override
  bool get disposeViewModel => false;

  @override
  bool get fireOnViewModelReadyOnce => false;

  @override
  Widget builder(
    BuildContext context,
    ScanViewModel viewModel,
    Widget? child,
  ) {
    return PageScaffold(
      title: "SCAN",
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: EzButton(
            foregroundColor: Colors.white,
            backgroundColor: kcPrimaryColorDark,
            title: "OPEN SCANNER",
            onPressed: () async {
              await viewModel.openScanner();
            },
          )),
      body: const EZEmptyDisplay(
          icon: Icon(
            Icons.qr_code_scanner_rounded,
            size: 30,
          ),
          title: "Point your camera at QR Code."),
    );
  }

  @override
  ScanViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ScanViewModel();
}
