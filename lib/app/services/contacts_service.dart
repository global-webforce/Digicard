import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:digicard/app/constants/env.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:http/http.dart' as http;

class ContactsService {
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

  Future saveContact(DigitalCard card) async {
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
