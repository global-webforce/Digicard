import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ContactsService with ListenableServiceMixin {
  final _supabase = Supabase.instance.client;
  final _userService = locator<UserService>();

  final ReactiveValue<List<DigitalCard>> _contacts =
      ReactiveValue<List<DigitalCard>>([]);

  ContactsService() {
    listenToReactiveValues([
      _userService,
      _contacts,
    ]);
  }

  List<DigitalCard> get contacts {
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
          .eq('user_id', _userService.id)
          .order('created_at', ascending: true);
      if (data is List) {
        _contacts.value = data
            .map(
              (e) => DigitalCard.fromJson(e["cards"])
                  .copyWith(addedAt: DateTime.parse(e["created_at"])),
            )
            .toList();

        notifyListeners();
      }
    } catch (e) {
      Future.error(e.toString());
    }
  }

  Future create(DigitalCard card) async {
    try {
      await _supabase.from('contacts').insert(
        {
          'card_id': card.id,
          'user_id': _userService.id,
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

  Future delete(DigitalCard card) async {
    try {
      await _supabase.from('contacts').delete().match({
        'card_id': card.id,
        'user_id': _userService.id,
      }).then((value) {
        _contacts.value.removeWhere((element) => element.id == card.id);
      });
      notifyListeners();
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
