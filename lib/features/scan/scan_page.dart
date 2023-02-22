import 'package:digicard/app/app.locator.dart';
import 'package:digicard/dashboards/user_dashboard/pages/dashboard_view.dart';
import 'package:digicard/features/scan/scan_view_model.dart';
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
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  leading: ezDrawerButton(
                    context,
                    DashboardParts.scaffoldkey,
                  ),
                  title: const Text('Mobile Scanner')),
              bottomSheet: EzButton.elevated(
                title: "Capture",
                onLongPress: () {},
              ),
              body: const Text("GGG"));
        });
  }
}
