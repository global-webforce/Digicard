import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:digicard/app/ui/widgets/app_icon.dart';
import 'package:digicard/app/views/contacts/contacts_view.dart';
import 'package:digicard/app/views/home/home_view.dart';
import 'package:digicard/app/views/scan_qr_code/scan_qr_code_view.dart';
import 'package:digicard/app/views/settings/settings_view.dart';

import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  autoHideDrawer(BuildContext context) {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      final scaffold = dashboardScaffoldKey.currentState;
      if (scaffold!.isDrawerOpen || isDesktop(context)) {
        scaffold.closeDrawer();
      }
    });
  }

  Widget divider() {
    return VerticalDivider(width: 2, thickness: 2, color: HexColor("#332D28"));
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const ScanQRCodeView();
      case 2:
        return const ContactsView();
      case 3:
        return const SettingsView();
    }
    return const HomeView();
  }

  @override
  Widget build(BuildContext context) {
    autoHideDrawer(context);
    return ViewModelBuilder<DashboardViewModel>.reactive(
      disposeViewModel: true,
      viewModelBuilder: () => DashboardViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, viewModel, child) => WillPopScope(
        onWillPop: () async {
          return await viewModel
              .confirmExit()
              .then((value) => value!.confirmed);
        },
        child: Scaffold(
            key: dashboardScaffoldKey,
            body: Row(
              children: [
                if (isDesktop(context))
                  EZDrawer(
                    colorTheme: kcPrimaryColor,
                    currentIndex: viewModel.currentIndex,
                    onTap: (i) {
                      viewModel.setIndex(i);
                    },
                    appBar: EZAppBar(
                      appName: appIcon(),
                    ),
                    items: [
                      EZDrawerMenuItem(
                        icon: FontAwesomeIcons.solidIdCard,
                        title: "CARDS",
                      ),
                      EZDrawerMenuItem(
                        icon: FontAwesomeIcons.camera,
                        title: "SCAN",
                      ),
                      EZDrawerMenuItem(
                        icon: FontAwesomeIcons.addressBook,
                        title: "CONTACTS",
                      ),
                      EZDrawerMenuItem(
                        icon: Icons.settings_rounded,
                        title: "SETTINGS",
                      ),
                    ],
                  ),
                if (isDesktop(context)) divider(),
                Expanded(child: getViewForIndex(viewModel.currentIndex)),
              ],
            ),
            drawerEnableOpenDragGesture: true,
            drawer: EZDrawer(
              colorTheme: kcPrimaryColor,
              currentIndex: viewModel.currentIndex,
              onTap: (i) {
                viewModel.setIndex(i);
                dashboardScaffoldKey.currentState?.closeDrawer();
              },
              appBar: EZAppBar(
                appName: appIcon(),
              ),
              items: [
                EZDrawerMenuItem(
                  icon: FontAwesomeIcons.solidIdCard,
                  title: "CARDS",
                ),
                EZDrawerMenuItem(
                  icon: FontAwesomeIcons.camera,
                  title: "SCAN",
                ),
                EZDrawerMenuItem(
                  icon: FontAwesomeIcons.addressBook,
                  title: "CONTACTS",
                ),
                EZDrawerMenuItem(
                  icon: Icons.settings_rounded,
                  title: "SETTINGS",
                ),
              ],
            ),
            bottomNavigationBar: EZBottomNavbar(
              colorTheme: kcPrimaryColor,
              currentIndex: viewModel.currentIndex,
              onTap: (i) {
                viewModel.setIndex(i);
              },
              items: [
                EZBottomNavbarItem(
                  icon: FontAwesomeIcons.solidIdCard,
                  title: "CARDS",
                ),
                EZBottomNavbarItem(
                  icon: FontAwesomeIcons.camera,
                  title: "SCAN",
                ),
                EZBottomNavbarItem(
                  icon: FontAwesomeIcons.addressBook,
                  title: "CONTACTS",
                ),
                EZBottomNavbarItem(
                  icon: Icons.settings_rounded,
                  title: "SETTINGS",
                ),
              ],
            )),
      ),
    );
  }
}

class DashboardViewModel extends IndexTrackingViewModel {
  final _dialogService = locator<DialogService>();
  Future<DialogResponse<dynamic>?> confirmExit() async {
    return _dialogService.showCustomDialog(
      variant: DialogType.confirmation,
      title: "Exit App",
      description: "You sure you want to exit App?",
      mainButtonTitle: "Cancel",
      secondaryButtonTitle: "Exit",
      barrierDismissible: true,
    );
  }
}
