import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/views/scan_qr_code/scan_qr_code_view_viewmodel.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/ez_drawer_button.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class ScanQRCodeView extends StatelessWidget {
  const ScanQRCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScanQRCodeViewModel>.reactive(
        viewModelBuilder: () => locator<ScanQRCodeViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (viewModel) {},
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: ezDrawerButton(context, dashboardScaffoldKey),
                title: Row(
                  children: const [
                    Icon(Icons.settings_rounded),
                    hSpaceRegular,
                    Text("SCAN")
                  ],
                ),
              ),
              bottomSheet: EzButton.elevated(
                title: "Capture",
                onLongPress: () {},
              ),
              body: const Text("GGG"));
        });
  }
}
