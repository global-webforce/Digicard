import 'package:collection/collection.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/views/card_open/card_open_view.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ContactsViewModel extends ReactiveViewModel {
  final log = getLogger('ContactsViewModel');
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _digitalCardsService = locator<DigitalCardService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _digitalCardsService,
      ];

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

  TextEditingController editingController = TextEditingController();

  Future init() async {
    await runBusyFuture(Future.wait([
      _digitalCardsService.getAll(),
    ], eagerError: true));
  }

  final focusNode = FocusNode();

  List<DigitalCard> _cards = [];

  Map<String, List<DigitalCard>> get cards {
    _cards = _digitalCardsService.digitalCards;

    if (editingController.text.isNotEmpty) {
      _cards = _cards
          .where((e) =>
              "${e.firstName} ${e.lastName}"
                  .toLowerCase()
                  .contains(editingController.text.toLowerCase()) ||
              "${e.position} ${e.company}"
                  .toLowerCase()
                  .contains(editingController.text.toLowerCase()))
          .toList();
    } else {
      _cards = _digitalCardsService.digitalCards;
    }

    Map<String, List<DigitalCard>> grouped = groupBy(
        _cards, (DigitalCard card) => "${card.firstName} ${card.lastName}"[0]);

    return grouped;
  }

  view(DigitalCard card) {
    _navigationService.navigateToView(CardOpenView(
      actionType: ActionType.view,
      card: card,
    ));
  }

  removeFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void clearFilter() {
    if (editingController.text.isNotEmpty) {
      editingController.text = "";
      notifyListeners();
    }
  }

  void filter() {
    notifyListeners();
  }

  int? selectedIndex;

  select(int i) {
    selectedIndex = i;
    notifyListeners();
  }

  //
}


//
