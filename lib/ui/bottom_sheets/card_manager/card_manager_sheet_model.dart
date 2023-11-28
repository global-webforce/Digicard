import 'package:digicard/app/app.bottomsheets.dart';
import 'package:digicard/app/app.dialogs.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/app.router.dart';
import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class CardManagerSheetModel extends ReactiveViewModel {
  final log = getLogger('CardManagerBottomSheetViewModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _digitalCardsService = locator<DigitalCardService>();
  final _navigationService = locator<RouterService>();

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

  late DigitalCardDTO card;

  share() {
    _bottomSheetService.completeSheet(SheetResponse());
    _bottomSheetService.showCustomSheet(
      ignoreSafeArea: false,
      variant: BottomSheetType.cardShare,
      data: card,
      isScrollControlled: true,
    );
  }

/*   view(DigitalCardDTO card) async {
    _bottomSheetService.completeSheet(SheetResponse());

    await _navigationService.navigateToCardViewerView(
      card: card,
      displayType: DisplayType.private,
    );
  } */

  view(DigitalCardDTO card) async {
    _bottomSheetService.completeSheet(SheetResponse());
    await _navigationService.navigateToCardViewerView(
        card: card, mode: DisplayMode.view);
  }

  edit(DigitalCardDTO card) async {
    _bottomSheetService.completeSheet(SheetResponse());

    await _navigationService.navigateToCardEditorView(
      key: UniqueKey(),
      card: card,
      actionType: ActionType.edit,
    );
  }

  duplicate(DigitalCardDTO digitalCard) async {
    _bottomSheetService.completeSheet(SheetResponse());

    await _navigationService.navigateToCardEditorView(
      key: UniqueKey(),
      card: digitalCard.copyWith(
        title: "${digitalCard.title} Copy",
        createdAt: null,
        addedToContactsAt: null,
      ),
      actionType: ActionType.duplicate,
    );
  }

  delete(int? id) async {
    final value = await _dialogService.showCustomDialog(
      variant: DialogType.confirm,
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
