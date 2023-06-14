import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/ui/_core/empty_display.dart';
import 'package:digicard/app/ui/_core/ez_button.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/views/scan_qr_code/scan_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import '../dashboard/dashboard_view.dart';

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
          return DashboardBuilder(
            onPop: (v) {
              v.setIndex(0);
              return Future.value(false);
            },
            builder: (context, child) {
              return Scaffold(
                drawer: child.drawer,
                bottomNavigationBar: child.bottomNavBar,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: const Text("SCAN"),
                ),
                bottomSheet: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: EzButton.elevated(
                      title: "OPEN QR SCANNER",
                      onTap: () {
                        viewModel.openScanner();
                      },
                    )),
                body: ScaffoldBodyWrapper(
                    centered: true,
                    builder: (context, size) {
                      return const EmptyDisplay(
                          icon: FontAwesomeIcons.qrcode,
                          title: "Point your camera at QR Code.");
                    }),
              );
            },
          );
        });
  }
}
