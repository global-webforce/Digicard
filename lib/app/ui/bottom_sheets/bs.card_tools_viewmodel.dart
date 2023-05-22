import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/views/card_open/card_open_view.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

const String duplicateBusyKey = 'duplicateBusyKey';
const String downloadQRBusyKey = 'downloadQRBusyKey';
const String deleteBusyKey = 'deleteBusyKey';
const String shareBusyKey = 'shareBusyKey';
const String saveToContactsBusyKey = 'saveToContactsBusyKey';
const String doneBusyKey = 'doneBusyKey';

class CardToolsBottomSheetViewModel extends ReactiveViewModel {
  final log = getLogger('CardToolsBottomSheetViewModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _digitalCardsService = locator<DigitalCardService>();
  final _navigationService = locator<NavigationService>();

  showDoneOverlay() async {
    setBusyForObject(doneBusyKey, true);
    await Future.delayed(const Duration(seconds: 1));
    setBusyForObject(doneBusyKey, false);
  }

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    {
      _dialogService.showCustomDialog(
          variant: DialogType.error,
          barrierDismissible: true,
          description: error.toString());
    }
    super.onFutureError(error, key);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardsService];

  late BuildContext context;
  late DigitalCard card;

  send() {
    _bottomSheetService.completeSheet(SheetResponse());
    _bottomSheetService.showCustomSheet(
      ignoreSafeArea: false,
      variant: BottomSheetType.send,
      data: card,
      isScrollControlled: true,
    );
  }

  view(DigitalCard card) {
    _bottomSheetService.completeSheet(SheetResponse());
    _navigationService.navigateToView(
      CardOpenView(
        actionType: ActionType.test,
        card: card,
      ),
      transitionStyle: Transition.fade,
      curve: Curves.easeIn,
    );
  }

  edit(DigitalCard card) {
    _bottomSheetService.completeSheet(SheetResponse());
    _navigationService.navigateToView(
      CardOpenView(
        actionType: ActionType.edit,
        card: card,
      ),
      transitionStyle: Transition.fade,
      curve: Curves.easeIn,
    );
  }

  duplicate(DigitalCard digitalCard) async {
    _bottomSheetService.completeSheet(SheetResponse());
    _navigationService.navigateToView(
      CardOpenView(
        actionType: ActionType.duplicate,
        card: digitalCard.copyWith(title: "${digitalCard.title} Copy"),
      ),
      transitionStyle: Transition.zoom,
      curve: Curves.easeIn,
    );
  }

  delete(int? id) async {
    final value = await _dialogService.showCustomDialog(
      variant: DialogType.confirmation,
      title: "Card Delete",
      description: "You sure you want to delete this card?",
      mainButtonTitle: "Delete",
      barrierDismissible: true,
    );
    if (value?.confirmed ?? false) {
      await runBusyFuture(_digitalCardsService.delete(card),
          busyObject: deleteBusyKey, throwException: true);
      _bottomSheetService.completeSheet(SheetResponse());
    }
    return null;
  }
}