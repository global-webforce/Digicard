import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:digicard/app/api/api_service.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactsService {
  final apiService = locator<ApiService>();
  Future saveContact(DigitalCard card) async {
    Map<String, List<CustomLink>> customLinks =
        groupBy(card.customLinks, (e) => "${e.type}");

    if (await FlutterContacts.requestPermission()) {
      Uint8List bytes =
          await apiService.getBytesFromUrl("${card.profileImage}");

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
