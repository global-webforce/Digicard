import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/env.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/_core/user_service.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:http/http.dart' as http;
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

  Future getAll() async {
    try {
      final data = await _supabase
          .from('contacts')
          .select('created_at, cards(*)')
          .eq('user_id', _userService.id)
          .order('created_at', ascending: true);
      if (data is List) {
        _contacts.value =
            data.map((e) => DigitalCard.fromJson(e['cards'])).toList();
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
        _contacts.value.add(card);
      });
    } catch (e) {
      Future.error(e.toString());
    }
  }

  Future delete(DigitalCard card) async {
    try {
      await _supabase.from('contacts').delete().eq('id', card.id);
      _contacts.value.removeWhere((element) => element.id == card.id);
      notifyListeners();
    } catch (e) {
      Future.error(e.toString());
    }
  }

  Future<Uint8List> getBytesFromUrl(String url) async {
    // Make a GET request to the URL
    final response = await http.get(Uri.parse(url));

    // Check if the response is successful
    if (response.statusCode == 200) {
      // Convert the response body to a Uint8List
      final bytes = response.bodyBytes;

      // Return the bytes
      return bytes;
    } else {
      // return errorMessage("Failed to load image");
      return Future.error("ee");
    }
  }

  Future save(DigitalCard card) async {
    Map<String, List<CustomLink>> customLinks =
        groupBy(card.customLinks, (e) => "${e.type}");

    if (await FlutterContacts.requestPermission()) {
      Uint8List bytes =
          await getBytesFromUrl("$avatarUrlPrefix${card.avatarUrl}");

      final newContact = Contact()
        ..photo = bytes
        ..displayName =
            "${card.prefix} ${card.firstName} ${card.middleName} ${card.lastName} ${card.suffix}"
        ..name.first = "${card.firstName}"
        ..name.last = "${card.lastName}"
        ..organizations = [
          Organization(
            title: "${card.position}",
            company: "${card.company}",
          )
        ]
        ..emails =
            customLinks["Email"]?.map((e) => Email("${e.text}")).toList() ?? []
        ..phones = customLinks["Phone Number"]
                ?.map((e) => Phone("${e.text}"))
                .toList() ??
            []
        ..websites =
            customLinks["Website"]?.map((e) => Website("${e.text}")).toList() ??
                []
        ..addresses =
            customLinks["Address"]?.map((e) => Address("${e.text}")).toList() ??
                [];

      await newContact.insert();
    } else {}
  }
}
