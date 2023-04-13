import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/helper/screen_size.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/views/_core/dashboard/dashboard_view.dart';
import 'package:digicard/app/views/settings/settings_view_model.dart';
import 'package:digicard/app/ui/_core/settings_ui.dart';
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
          return Scaffold(
            drawer: isDesktop(context) ? null : const $EzDrawer(),
            appBar: const SettingsAppBar(),
            bottomNavigationBar: const $EZBottomNavbar(),
            body: ScaffoldBodyWrapper(
              builder: (contact, size) {
                return SettingsList(sections: [
                  SettingsSection(title: "SESSION", tiles: [
                    SettingsTile(
                      icon: RoundedIcon(
                        const Icon(
                          Icons.account_box_rounded,
                          color: Colors.white,
                        ),
                        background: Colors.orange.withOpacity(0.6),
                      ),
                      title: "User Profile",
                      subtitle: "Update your account profile here",
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: RoundedIcon(
                        const Icon(
                          Icons.delete_forever_rounded,
                          color: Colors.white,
                        ),
                        background: Colors.orange.withOpacity(0.6),
                      ),
                      title: "Delete Account",
                      subtitle: "Permanently delete your account",
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: RoundedIcon(
                        const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        background: Colors.red.withOpacity(0.6),
                      ),
                      title: "Logout",
                      onTap: () async {
                        await viewModel.logout();
                      },
                    )
                  ])
                ]);
              },
            ),
          );
        });
  }
}
