import 'dart:async';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/dialog_ui.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/bottomsheet_ui.dart';
import 'package:digicard/app/services/contacts_service.dart';

import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/services/user_service.dart';
import 'package:digicard/app/views/card_editor/card_editor_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final log = getLogger('HomeViewModel');

  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final userService = locator<UserService>();
  final _digitalCardService = locator<DigitalCardService>();
  final _contactsService = locator<ContactsService>();
  @override
  List<ListenableServiceMixin> get listenableServices => [
        _digitalCardService,
      ];

  List<DigitalCard> get digitalCards => _digitalCardService.digitalCards;

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    super.onFutureError(error, key);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString(),
      );
    });
  }

  Future<DialogResponse<dynamic>?> confirmExit() async {
    return await _dialogService.showCustomDialog(
      variant: DialogType.confirmation,
      title: "Exit App",
      description: "You sure you want to exit?",
      mainButtonTitle: "Yes",
      secondaryButtonTitle: "Cancel",
      barrierDismissible: true,
    );
  }

  view(DigitalCard card) {
    _navigationService.navigateToView(
      CardEditorView(
        actionType: ActionType.view,
        card: card,
      ),
      transitionStyle: Transition.fade,
      curve: Curves.easeIn,
    );
  }

  show(DigitalCard? digitalCard) async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.digitalCard,
      data: digitalCard,
      isScrollControlled: true,
      useRootNavigator: true,
    );
  }

  create() {
    _navigationService.navigateToView(
      CardEditorView(
        actionType: ActionType.create,
        card: DigitalCard(),
      ),
      transitionStyle: Transition.fade,
      curve: Curves.easeIn,
    );
  }

  Future init() async {
    await runBusyFuture(
      Future.wait([
        _digitalCardService.getAll(),
        _contactsService.getAll(),
      ]),
      throwException: true,
    );
  }
}
