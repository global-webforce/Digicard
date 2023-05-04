import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/ui/_core/settings_ui.dart';
import 'package:digicard/app/views/dashboard/dashboard_view.dart';
import 'package:digicard/app/views/settings/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsAppBar extends StatelessWidget with PreferredSizeWidget {
  const SettingsAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(56);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("SETTINGS"),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => locator<SettingsViewModel>(),
        onViewModelReady: (viewModel) async {},
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return DashboardBuilder(onPop: (v) {
            v.setIndex(0);
            return Future.value(false);
          }, builder: (context, child) {
            return Scaffold(
                drawer: child.drawer,
                appBar: const SettingsAppBar(),
                bottomNavigationBar: child.bottomNavBar,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SettingsItem.header(leading: "Plan"),
                      const SettingsItem(
                        leading: "Digicard Free",
                        subtitle: "Contact us to upgrade your plan.",
                      ),
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
                    ],
                  ),
                ));
          });
        });
  }
}
