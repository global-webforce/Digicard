import 'package:auto_route/auto_route.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:digicard/app/routes/app_router.gr.dart';

class ScaffoldPage extends StatelessWidget {
  const ScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppScaffold.autoHideDrawer(context);
    return WillPopScope(
        onWillPop: () => AppScaffold.exitDialog(context),
        child: AutoTabsScaffold(
          scaffoldKey: AppScaffold.scaffoldkey,
          builder: (context, child, animation) {
            return Row(
              children: [
                if (isDesktop(context)) AppScaffold.drawer(context),
                if (isDesktop(context)) AppScaffold.divider(),
                Expanded(child: child),
              ],
            );
          },
          routes: const [
            HomeRoute(),
            ScanRoute(),
            ContactsRoute(),
            SettingsRoute(),
          ],
          drawerEnableOpenDragGesture: true,
          drawer: AppScaffold.drawer(context),
          bottomNavigationBuilder: (context, tabsRouter) =>
              AppScaffold.bottomNavBar(context),
        ));
  }
}

class AppScaffold {
  AppScaffold._();

  static GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  static void autoHideDrawer(BuildContext context) {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      final scaffold = AppScaffold.scaffoldkey.currentState;
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
              color: Colors.orange, borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: Text(
              "PRO",
              style: TextStyle(color: Colors.black),
            ),
          )),
    ],
  );

  static Widget drawer(BuildContext context) {
    return EZDrawer(
      appBar: EZAppBar(
        appName: appIcon,
      ),
      items: [
        EZDrawerMenuItem(
          icon: FontAwesomeIcons.solidIdCard,
          title: "CARDS",
          route: const HomeRoute(),
        ),
        EZDrawerMenuItem(
          icon: FontAwesomeIcons.camera,
          title: "SCAN",
          route: const ScanRoute(),
        ),
        EZDrawerMenuItem(
          icon: FontAwesomeIcons.addressBook,
          title: "CONTACTS",
          route: const ContactsRoute(),
        ),
        EZDrawerMenuItem(
          icon: Icons.settings_rounded,
          title: "SETTINGS",
          route: const SettingsRoute(),
        ),
      ],
    );
  }

  static Widget bottomNavBar(BuildContext context) => EZBottomNavbar(
        items: [
          EZBottomNavbarItem(
            icon: FontAwesomeIcons.solidIdCard,
            title: "CARDS",
            route: const HomeRoute(),
          ),
          EZBottomNavbarItem(
            icon: FontAwesomeIcons.camera,
            title: "SCAN",
            route: const ScanRoute(),
          ),
          EZBottomNavbarItem(
            icon: FontAwesomeIcons.addressBook,
            title: "CONTACTS",
            route: const ContactsRoute(),
          ),
          EZBottomNavbarItem(
            icon: Icons.settings_rounded,
            title: "SETTINGS",
            route: const SettingsRoute(),
          ),
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
