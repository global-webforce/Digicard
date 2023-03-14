import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/views/scan_qr_code/scan_viewmodel.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/ez_drawer_button.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ScanView extends StatelessWidget {
  const ScanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScanViewModel>.reactive(
        viewModelBuilder: () => locator<ScanViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (viewModel) {},
        onDispose: (viewModel) {
          viewModel.controller?.dispose();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            bottomSheet: Container(
              padding: const EdgeInsets.all(15),
              child: EzButton.elevated(
                title: "SCAN QR CODE",
                onTap: () {
                  viewModel.openScanner();
                },
              ),
            ),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: ezDrawerButton(context, dashboardScaffoldKey),
              title: Row(
                children: const [
                  Icon(Icons.camera_roll_rounded),
                  hSpaceRegular,
                  Text("SCAN")
                ],
              ),
            ),
            body: ScaffoldBodyWrapper(
                centered: true,
                builder: (context, size) {
                  return const Text("Point your camera at QR Code");
                }),
          );
        });
  }
}
