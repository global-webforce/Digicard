import 'dart:ui';

import 'package:digicard/app/bottomsheet_ui.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/dialog_ui.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/contacts_service.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CardDisplayViewModel extends ReactiveViewModel {
  final log = getLogger('CardDisplayViewModel');
  final _supabase = Supabase.instance.client;
  User? get user => _supabase.auth.currentUser;

  final _contactsService = locator<ContactsService>();
  final _digitalCardService = locator<DigitalCardService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  @override
  void onFutureError(error, Object? key) {
    log.e(error);

    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());

    super.onFutureError(error, key);
  }

  late DigitalCard card;
  late DisplayType action;
  Color get color => Color(card.color ?? kcPrimaryColorInt);

  bool isUserPresent() => user != null;
  isCardOwnedByUser() => "${card.userId}" == "${user?.id}";
  bool isCardInContacts() {
    final temp = _contactsService.contacts.indexWhere((e) => e.id == card.id);
    return temp != -1 ? true : false;
  }

  Future downloadVcf() async {
    await runBusyFuture(_contactsService.downloadVcf(card),
        throwException: true, busyObject: saveBusyKey);
  }

  loadCardbyUuid(String uuid) async {
    card = await runBusyFuture(_digitalCardService.findOne(uuid),
            busyObject: loadingCardBusyKey, throwException: true) ??
        DigitalCard();

/*     if (card.id == null) {
      await _dialogService.showCustomDialog(
        variant: DialogType.simple,
        title: "Card not found",
        description: "This card might be deleted by the owner.",
      );
    } */
  }

  bool isDarkMode = false;
  checkTheme() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    isDarkMode = brightness == Brightness.dark;
  }

  Future saveToContacts() async {
    await runBusyFuture(
        Future.wait([
          _contactsService.saveToDeviceContacts(card),
          _contactsService.saveToAppContacts(card),
        ]),
        throwException: true,
        busyObject: saveBusyKey);
    setBusyForObject(doneBusyKey, true);
    await Future.delayed(const Duration(seconds: 1));
    setBusyForObject(doneBusyKey, false);
  }

  showOptions() {
    _bottomSheetService
        .showCustomSheet(variant: BottomSheetType.delete)
        .then((value) async {
      if (value?.confirmed == true) {
        await delete(card.id);
      }
    });
  }

  Future delete(int? id) async {
    final value = await _dialogService.showCustomDialog(
      variant: DialogType.confirmation,
      title: "Card Delete",
      description: "You sure you want to delete this contact?",
      mainButtonTitle: "Delete",
      barrierDismissible: true,
    );
    if (value?.confirmed ?? false) {
      await runBusyFuture(_contactsService.delete(card),
          busyObject: deleteBusyKey, throwException: true);
    }
    return null;
  }
}
