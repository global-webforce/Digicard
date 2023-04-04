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

  void setIndex(int value) {
    _currentIndex = value;

    rebuildUi();
  }

  bool isIndexSelected(int index) => _currentIndex == index;

  Component? component() {
    final List<Component> x = [
      Component(
        view: const HomeView(),
      ),
      Component(
        view: const ScanView(),
      ),
      Component(
        view: const ContactsView(),
      ),
      Component(
        view: const SettingsView(),
      ),
    ];
    return x[_currentIndex];
  }
}

class Component {
  final PreferredSizeWidget? appBar;
  final Widget? view;
  final Widget? bottomSheet;
  final Widget? floatingActionButton;
  Component(
      {this.appBar, this.view, this.bottomSheet, this.floatingActionButton});
}
