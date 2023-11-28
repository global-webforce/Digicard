import 'package:digicard/ui/views/dashboard/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/widgets/settings_ui.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  bool get disposeViewModel => false;

  @override
  bool get fireOnViewModelReadyOnce => false;

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return PageScaffold(
        title: "SETTINGS",
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SettingsItem.header(leading: "Plan"),
              const SettingsItem(
                leading: "Digicard Free",
                subtitle: "Contact us to upgrade your plan.",
              ),
              const SettingsItem.header(
                leading: "Digicard",
              ),
              const SettingsItem(
                leading: "Version",
                trailing: "1.0.0",
              ),
              const Divider(height: 0),
              const SettingsItem(
                leading: "Developer",
                trailing: "Global Webforce",
              ),
              const SettingsItem.header(
                leading: "Digicard",
              ),
              /*   SettingsItem(
                leading: "Theme",
                trailing: "Toggle Dark Mode",
                onTap: () {
                  getThemeManager(context).toggleDarkLightTheme();
                },
              ), */
              const SettingsItem.header(leading: "Account"),
              SettingsItem(
                leading: "Email",
                trailing: viewModel.email,
              ),
              const Divider(height: 0),
              SettingsItem(
                leading: "Logout",
                onTap: () {
                  viewModel.logout();
                },
              ),
            ],
          ),
        ));
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
