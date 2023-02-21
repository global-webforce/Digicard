import 'package:digicard/app/app.locator.dart';
import 'package:digicard/features/scan/scan_view_model.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScanViewModel>.reactive(
        viewModelBuilder: () => locator<ScanViewModel>(),
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(title: const Text('Mobile Scanner')),
              bottomSheet: EzButton.elevated(
                title: "Capture",
                onLongPress: () {},
              ),
              body: const Text("GGG"));
        });
  }
}
