import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/views/settings/settings_view_view_model.dart';
import 'package:digicard/app/ui/_core/settings_ui.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => locator<SettingsViewModel>(),
        onViewModelReady: (viewModel) async {},
        disposeViewModel: false,
        builder: (context, viewModel, child) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: ezDrawerButton(context, dashboardScaffoldKey),
              title: Row(
                children: const [
                  Icon(Icons.settings_rounded),
                  hSpaceRegular,
                  Text("SETTINGS")
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(14),
              child: SettingsList(sections: [
                SettingsSection(title: "SESSION", tiles: [
                  SettingsTile(
                    icon: RoundedIcon(
                      const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      background: Colors.red.shade400,
                    ),
                    title: "Logout",
                    onTap: () async {
                      await viewModel.logout();
                    },
                  )
                ])
              ]),
            )));
  }
}
