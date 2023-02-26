/* import 'package:digicard/main/dashboard/home/home_view.dart';
import 'package:digicard/main/features/contacts/contacts_view.dart';
import 'package:digicard/main/features/scan_qr_code/scan_qr_code_view.dart';
import 'package:digicard/main/features/settings/settings_view.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

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
    DashboardParts.autoHideDrawer(context);
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder: (context, viewModel, child) => WillPopScope(
        onWillPop: () => DashboardParts.exitDialog(context),
        child: Scaffold(
            key: DashboardParts.scaffoldkey,
            body: Row(
              children: [
                if (isDesktop(context))
                  EZDrawer(
                    currentIndex: viewModel.currentIndex,
                    onTap: (i) {
                      viewModel.setIndex(i);
                    },
                    appBar: EZAppBar(
                      appName: DashboardParts.appIcon,
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
                if (isDesktop(context)) DashboardParts.divider(),
                Expanded(child: getViewForIndex(viewModel.currentIndex)),
              ],
            ),
            drawerEnableOpenDragGesture: true,
            drawer: EZDrawer(
              currentIndex: viewModel.currentIndex,
              onTap: (i) {
                viewModel.setIndex(i);
                DashboardParts.scaffoldkey.currentState?.closeDrawer();
              },
              appBar: EZAppBar(
                appName: DashboardParts.appIcon,
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
      viewModelBuilder: () => DashboardViewModel(),
    );
  }
}

class DashboardViewModel extends IndexTrackingViewModel {}

class DashboardParts {
  DashboardParts._();

  static GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  static void autoHideDrawer(BuildContext context) {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      final scaffold = DashboardParts.scaffoldkey.currentState;
      if (scaffold!.isDrawerOpen || isDesktop(context)) {
        scaffold.closeDrawer();
      }
    });
  }

  static Widget divider() {
    return VerticalDivider(width: 2, thickness: 2, color: HexColor("#332D28"));
  }

  static Widget appIcon = Row(
    children: [
      const Icon(
        Icons.qr_code_2_rounded,
        size: 30,
        color: Colors.white,
      ),
      const SizedBox(
        width: 10,
      ),
      const Text("DIGICARD"),
      hSpaceSmall,
      Container(
          decoration: BoxDecoration(
              color: kcPrimaryColor, borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: Text(
              "PRO",
              style: TextStyle(color: Colors.black),
            ),
          )),
    ],
  );

  Future showExitPopup(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit App'),
        content: const Text('Do you want to exit an App?'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  static Future<bool> exitDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
 */
