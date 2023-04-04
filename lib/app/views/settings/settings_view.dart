import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/helper/screen_size.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
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
      title: Row(
        children: const [
          Icon(Icons.settings_rounded),
          hSpaceRegular,
          Text("SETTINGS")
        ],
      ),
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
                ]);
              },
            ),
          );
        });
  }
}
