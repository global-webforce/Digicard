import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app_view_model.dart';
import 'package:digicard/dashboards/user_dashboard/pages/dashboard_view.dart';
import 'package:digicard/features/create_card/viewmodels/digital_card_view_model.dart';
import 'package:digicard/features/settings/widgets/settings_ui.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DigitalCardViewModel>.reactive(
        viewModelBuilder: () => locator<DigitalCardViewModel>(),
        onViewModelReady: (viewModel) async {},
        disposeViewModel: false,
        builder: (context, viewModel, child) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: ezDrawerButton(
                context,
                DashboardParts.scaffoldkey,
              ),
              title: Row(
                children: const [
                  Icon(Icons.settings_rounded),
                  hSpaceRegular,
                  Text("SETTINGS")
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.orange,
                child: const Icon(Icons.add),
                onPressed: () {}),
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
                      ScaffoldMessenger.of(context).clearSnackBars();
                      await getParentViewModel<AppViewModel>(context,
                              listen: false)
                          .signOut();
                    },
                  )
                ])
              ]),
            )));
  }
}
