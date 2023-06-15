import 'package:collection/collection.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/contacts_service.dart';
import 'package:digicard/app/views/card_editor/card_editor_view.dart';
import 'package:digicard/app/views/card_editor/card_editor_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

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

  List<DigitalCard> _contacts = [];
  List<DigitalCard> get contactList => _contacts;

  Map<String, List<DigitalCard>> get contacts {
    _contacts = _contactsService.contacts;

    Map<String, List<DigitalCard>> grouped = groupBy(_contacts,
        (DigitalCard card) => "${card.firstName} ${card.lastName}"[0]);

    return grouped;
  }

  view(DigitalCard card) {
    _navigationService.navigateToView(CardEditorView(
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
