import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/models/digital_card.dart';

import 'package:digicard/app/services/_core/app_service.dart';
import 'package:digicard/app/models/user.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/views/card_open/card_open_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../card_open/card_open_viewmodel.dart';

class ContactsViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _appService = locator<AppService>();

  final _digitalCardsService = locator<DigitalCardService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardsService];

  TextEditingController editingController = TextEditingController();

  List<DigitalCard> _cards = [];

  List<DigitalCard> get cards {
    _cards = _digitalCardsService.digitalCards;

    if (editingController.text.isNotEmpty) {
      _cards = _cards
          .where((e) =>
              "${e.fullname?.firstName} ${e.fullname?.lastName}"
                  .toLowerCase()
                  .contains(editingController.text.toLowerCase()) ||
              "${e.position} ${e.company}"
                  .toLowerCase()
                  .contains(editingController.text.toLowerCase()))
          .toList();
    } else {
      _cards = _digitalCardsService.digitalCards;
    }

    _cards.sort((a, b) => "${a.fullname?.firstName} ${a.fullname?.lastName}"
        .compareTo("${b.fullname?.firstName} ${a.fullname?.lastName}"));

    return _cards;
  }

  view(DigitalCard card) {
    _navigationService.navigateToView(CardOpenView(
      actionType: ActionType.view,
      card: card,
    ));
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

  User? get user => _appService.user;

  int? selectedIndex;

  select(int i) {
    selectedIndex = i;
    notifyListeners();
  }

  //
}
