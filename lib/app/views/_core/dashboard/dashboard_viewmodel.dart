import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/views/contacts/contacts_view.dart';
import 'package:digicard/app/views/home/home_view.dart';
import 'package:digicard/app/views/scan_qr_code/scan_qr_code_view.dart';
import 'package:digicard/app/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends BaseViewModel {
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

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _reverse = false;

  bool get reverse => _reverse;

  void setIndex(int value) {
    if (value < _currentIndex) {
      _reverse = true;
    } else {
      _reverse = false;
    }
    _currentIndex = value;
    rebuildUi();
  }

  bool isIndexSelected(int index) => _currentIndex == index;

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
}
