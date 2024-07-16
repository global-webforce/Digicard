import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ContactsService with ListenableServiceMixin {
  final _supabase = Supabase.instance.client;
  final _userService = locator<UserService>();

  final ReactiveValue<List<DigitalCardDTO>> _contacts =
      ReactiveValue<List<DigitalCardDTO>>([]);

  ContactsService() {
    listenToReactiveValues([
      _userService,
      _contacts,
    ]);
  }

  void clearData() {
    _contacts.value.clear();
  }

  List<DigitalCardDTO> get contacts {
    return _contacts.value.reversed.toList();
  }

  set contacts(val) {
    _contacts.value = val;
  }

  Future getAll() async {
    try {
      final data = await _supabase
          .from('contacts')
          .select('id, created_at, cards(*)')
          .eq('user_id', "${_userService.userId}")
          .order('created_at', ascending: true);
      _contacts.value = data
          .map(
            (e) => DigitalCardDTO.fromJson(e["cards"])
                .copyWith(addedToContactsAt: DateTime.parse(e["created_at"])),
          )
          .toList();

      notifyListeners();
    } catch (e) {
      Future.error(e.toString());
    }
  }

  Future create(DigitalCardDTO card) async {
    try {
      await _supabase.from('contacts').insert(
        {
          'card_id': card.id,
          'user_id': _userService.userId,
        },
      ).then((value) {
        if (!_contacts.value.contains(card)) {
          _contacts.value.add(card);
          notifyListeners();
        }
      });
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future delete(DigitalCardDTO card) async {
    try {
      await _supabase.from('contacts').delete().match({
        'card_id': "${card.id}",
        'user_id': "${_userService.userId}",
      }).then((value) {
        _contacts.value.removeWhere((element) => element.id == card.id);
      });
      notifyListeners();
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
