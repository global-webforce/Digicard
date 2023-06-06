import 'package:collection/collection.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/contacts_service.dart';
import 'package:digicard/app/views/card_open/card_open_view.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../models/digicontact.dart';

class ContactsViewModel extends ReactiveViewModel {
  final log = getLogger('ContactsViewModel');
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _contactsService = locator<ContactsService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _contactsService,
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

  Future init() async {
    await runBusyFuture(Future.wait([
      _contactsService.getAll(),
    ], eagerError: true));
  }

  final focusNode = FocusNode();

  List<DigiContact> _contacts = [];
  List<DigiContact> get contactList => _contacts;

  Map<String, List<DigiContact>> get contacts {
    _contacts = _contactsService.contacts;

    Map<String, List<DigiContact>> grouped = groupBy(
        _contacts,
        (DigiContact contact) =>
            "${contact.card.firstName} ${contact.card.lastName}"[0]);

    return grouped;
  }

  view(DigitalCard card) {
    _navigationService.navigateToView(CardOpenView(
      actionType: ActionType.view,
      card: card,
    ));
  }

  int? selectedIndex;

  select(int i) {
    selectedIndex = i;
    notifyListeners();
  }
}
