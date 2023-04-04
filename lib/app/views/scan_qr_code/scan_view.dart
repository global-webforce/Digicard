import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/helper/screen_size.dart';
import 'package:digicard/app/ui/_core/ez_button.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/views/scan_qr_code/scan_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../_core/dashboard/dashboard_view.dart';

class ScanAppBar extends StatelessWidget with PreferredSizeWidget {
  const ScanAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(56);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: const [
          Icon(Icons.camera_roll_rounded),
          hSpaceRegular,
          Text("SCAN")
        ],
      ),
    );
  }
}

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
            drawer: isDesktop(context) ? null : const $EzDrawer(),
            bottomNavigationBar: const $EZBottomNavbar(),
            appBar: const ScanAppBar(),
            bottomSheet: Container(
                padding: const EdgeInsets.all(15),
                child: EzButton.elevated(
                  title: "OPEN QR SCANNER",
                  onTap: () {
                    viewModel.openScanner();
                  },
                )),
            body: ScaffoldBodyWrapper(
                centered: true,
                builder: (context, size) {
                  return const Text("Point your camera at QR Code");
                }),
          );
        });
  }
}
