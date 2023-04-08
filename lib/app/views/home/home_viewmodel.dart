import 'dart:async';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/services/_core/auth_service_supabase.dart';

import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/views/card_open/card_open_view.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final log = getLogger('HomeViewModel');

  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _digitalCardService = locator<DigitalCardService>();
  final _navigationService = locator<NavigationService>();
  final authService = locator<AuthService>();
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

  view(DigitalCard card) {
    _navigationService.navigateToView(
      CardOpenView(
        actionType: ActionType.view,
        card: card,
      ),
      transitionStyle: Transition.fade,
      curve: Curves.easeIn,
    );
  }

  show(DigitalCard? digitalCard) async {
    await _bottomSheetService.showCustomSheet(
      enterBottomSheetDuration: const Duration(milliseconds: 350),
      exitBottomSheetDuration: const Duration(milliseconds: 350),
      variant: BottomSheetType.digitalCard,
      data: digitalCard,
      isScrollControlled: true,
      useRootNavigator: true,
    );
  }

  create() {
    _navigationService.navigateToView(
      CardOpenView(
        actionType: ActionType.create,
        card: DigitalCard(),
      ),
      transitionStyle: Transition.fade,
      curve: Curves.easeIn,
    );
  }

  Future init() async {
    try {
      await runBusyFuture(
        _digitalCardService.getAll(),
        throwException: true,
      );
    } catch (e) {}
  }
}
