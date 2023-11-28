import 'dart:async';
import 'package:digicard/app/app.bottomsheets.dart';
import 'package:digicard/app/app.dialogs.dart';
import 'package:digicard/app/app.router.dart';
import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/services/digital_card_service.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final log = getLogger('HomeViewModel');

  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<RouterService>();
  final _digitalCardService = locator<DigitalCardService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _digitalCardService,
      ];

  List<DigitalCardDTO> get digitalCards => _digitalCardService.digitalCards;

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
      variant: DialogType.confirm,
      title: "Exit App",
      description: "You sure you want to exit?",
      mainButtonTitle: "Yes",
      secondaryButtonTitle: "Cancel",
      barrierDismissible: true,
    );
  }

  Future show(DigitalCardDTO? card) async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.cardManager,
      data: card,
      isScrollControlled: true,
      useRootNavigator: true,
    );
  }

  Future create() async {
    await _navigationService.navigateToCardEditorView(
      card: DigitalCardDTO.blank(),
      actionType: ActionType.create,
    );
  }

  Future init() async {
    await runBusyFuture(
      Future.wait([
        _digitalCardService.getAll(),
      ]),
      throwException: true,
    );
/*     EasyThrottle.throttle(
        'my-debouncer', // <-- An ID for this particular debouncer
        const Duration(seconds: 4), // <-- The debounce duration

        () async => ); */
  }
}
