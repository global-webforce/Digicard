import 'dart:typed_data';

import 'package:digicard/app/api/api_service.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactsService {
  final apiService = locator<ApiService>();
  Future saveContact(DigitalCard card) async {
    if (await FlutterContacts.requestPermission()) {
      Uint8List bytes =
          await apiService.getBytesFromUrl("${card.profileImage}");

      final newContact = Contact()
            ..photo = bytes
            ..displayName =
                "${card.fullname?.prefix} ${card.fullname?.firstName} ${card.fullname?.middleName} ${card.fullname?.lastName} ${card.fullname?.suffix}"
            ..name.first = "${card.fullname?.firstName}"
            ..name.last = "${card.fullname?.lastName}"
            ..organizations = [
              Organization(
                title: "${card.position}",
                company: "${card.company}",
              )
            ]
          /*      ..emails = [
          Email("${card.email}"),
        ]
        ..phones = [
          Phone(
            "${card.mobileNumber}",
          )
        ]
        ..websites = [
          Website("${card.website}"),
        ]
        ..notes = [
          Note("${card.shortBio}"),
        ] */
          ;

      await newContact.insert();
    } else {}
  }
}
