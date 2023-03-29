import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/helper/screen_size.dart';
import 'package:digicard/app/ui/_core/dashboard/ez_appbar.dart';
import 'package:digicard/app/ui/_core/dashboard/ez_bottom_navbar.dart';
import 'package:digicard/app/ui/_core/dashboard/ez_drawer.dart';
import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:digicard/app/ui/widgets/app_icon.dart';
import 'package:digicard/app/views/_core/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  autoHideDrawer(BuildContext context) {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      final scaffold = scaffoldKey.currentState;
      if (scaffold!.isDrawerOpen || isDesktop(context)) {
        scaffold.closeDrawer();
      }
    });
  }

  @override
  void didUpdateWidget(covariant DashboardView oldWidget) {
    autoHideDrawer(context);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => DashboardViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, viewModel, child) => WillPopScope(
        onWillPop: () async {
          return await viewModel
              .confirmExit()
              .then((value) => value!.confirmed);
        },
        child: Scaffold(
            key: scaffoldKey,
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
                Expanded(
                    child: viewModel.getViewForIndex(viewModel.currentIndex)),
              ],
            ),
            drawerEnableOpenDragGesture: true,
            drawer: EZDrawer(
              colorTheme: kcPrimaryColor,
              currentIndex: viewModel.currentIndex,
              onTap: (i) {
                viewModel.setIndex(i);
                scaffoldKey.currentState?.closeDrawer();
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
