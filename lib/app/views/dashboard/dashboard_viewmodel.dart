import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/views/contacts/contacts_view.dart';
import 'package:digicard/app/views/home/home_view.dart';
import 'package:digicard/app/views/scan_qr_code/scan_view.dart';
import 'package:digicard/app/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends BaseViewModel {
  int selectedIndex = 0;
  final PageController pageController = PageController();
  final dialogService = locator<DialogService>();

  bool visited = false;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int value) {
    _currentIndex = value;
    rebuildUi();
  }

  bool isIndexSelected(int index) => _currentIndex == index;

  final List<Widget> screens = [
    const HomeView(),
    const ScanView(),
    const ContactsView(),
    const SettingsView(),
  ];

  confirmExit() async {
    final shouldPop = await dialogService.showCustomDialog(
      variant: DialogType.confirmation,
      title: "Exit App",
      description: "You sure you want to exit?",
      mainButtonTitle: "Confirm",
      secondaryButtonTitle: "Cancel",
      barrierDismissible: true,
    );
    return shouldPop?.confirmed ?? false;
  }
}
