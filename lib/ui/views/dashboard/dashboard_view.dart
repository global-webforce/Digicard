import 'package:digicard/app/app.locator.dart';
import 'package:digicard/ui/views/contacts/contacts_viewmodel.dart';
import 'package:digicard/ui/views/dashboard/widgets/split_view.dart';
import 'package:digicard/ui/views/home/home_view.dart';
import 'package:digicard/ui/views/home/home_viewmodel.dart';
import 'package:digicard/ui/views/scan/scan_view.dart';
import 'package:digicard/ui/views/scan/scan_viewmodel.dart';
import 'package:digicard/ui/views/settings/settings_view.dart';
import 'package:digicard/ui/views/settings/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  void onDispose(DashboardViewModel viewModel) {
    locator<HomeViewModel>().setOnModelReadyCalled(false);
    locator<ScanViewModel>().setOnModelReadyCalled(false);
    locator<ContactsViewModel>().setOnModelReadyCalled(false);
    locator<SettingsViewModel>().setOnModelReadyCalled(false);
    super.onDispose(viewModel);
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView(
          key: ValueKey('HomeView'),
        );
      case 1:
        return const ScanView(
          key: ValueKey('ScanView'),
        );
      /*      case 2:
        return const ContactsView(
          key: ValueKey('ContactsView'),
        ); */
      case 2:
        return const SettingsView(
          key: ValueKey('SettingsView'),
        );
      default:
        return const HomeView(
          key: ValueKey('HomeView'),
        );
    }
  }

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
        onWillPop: () async {
          viewModel.setIndex(0);

          return await Future.value(false);
        },
        child: SplitView(
            key: UniqueKey(), child: getViewForIndex(viewModel.currentIndex)));
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
