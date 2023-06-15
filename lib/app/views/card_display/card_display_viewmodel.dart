import 'dart:ui';

import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/contacts_service.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum DisplayType {
  private,
  public,
}

class CardDisplayViewModel extends ReactiveViewModel {
  final log = getLogger('CardDisplayViewModel');
  final _supabase = Supabase.instance.client;
  User? get user => _supabase.auth.currentUser;

  final _contactsService = locator<ContactsService>();

  late DigitalCard card;
  Color get color => Color(card.color ?? kcPrimaryColorInt);

  bool isUserPresent() => user != null;
  isCardOwnedByUser() => "${card.userId}" == "${user?.id}";
  bool isCardInContacts() {
    final temp = _contactsService.contacts.indexWhere((e) => e.id == card.id);
    return temp != -1 ? true : false;
  }
}
