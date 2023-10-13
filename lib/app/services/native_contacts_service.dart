import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_html/js.dart' as js;

class NativeContactsService with ListenableServiceMixin {
  /// Saves Contact to native contact app of mobile
  Future save(DigitalCard card) async {
    await _cardToContact(card).then((value) async {
      try {
        if (value != null) {
          if (!kIsWeb) {
            if (await FlutterContacts.requestPermission()) {
              value.insert();
            }
          }
        }
      } catch (e) {
        rethrow;
      }
    });
  }

  /// Saves Contact as .vcf file
  Future download(DigitalCard card) async {
    try {
      await _cardToContact(card).then((value) async {
        if (value != null) {
          if (kIsWeb) {
            final bytes =
                utf8.encode(value.toVCard(withPhoto: true, includeDate: true));
            await js.context.callMethod("saveAs", <Object>[
              html.Blob(<Object>[bytes]),
              '${card.uuid}.vcf'
            ]);
          }
        }
      });
    } catch (e) {
      Future.error(e.toString());
    }
  }

  Future<Contact?> _cardToContact(DigitalCard card) async {
    try {
      Map<String, List<CustomLink>> customLinks =
          groupBy(card.customLinks, (e) {
        return "${e.type}";
      });
      Uint8List? bytes;
      if (card.avatarUrl.isNotNullOrEmpty()) {
        bytes = await _urlToUint8List(card.avatarHttpUrl);
      }

      return Contact(
          photo: bytes,
          displayName: "${card.firstName ?? ''} ${card.lastName ?? ''}".clean(),
          name: Name(
            first: card.firstName ?? '',
            last: card.lastName ?? '',
            middle: card.middleName ?? '',
        
            prefix: card.prefix ?? '',
            suffix: card.suffix ?? '',
          ),
          organizations: [
            Organization(
              title: card.position ?? '',
              company: card.company ?? '',
            )
          ],
          emails: customLinks["Email"]?.map((e) {
                return Email(e.text ?? '');
              }).toList() ??
              [],
          phones: customLinks["Phone Number"]?.map((e) {
                return Phone(e.text ?? '');
              }).toList() ??
              [],
          websites: customLinks["Website"]?.map((e) {
                return Website(e.text ?? '');
              }).toList() ??
              [],
          addresses: customLinks["Address"]?.map((e) {
                return Address(e.text ?? '');
              }).toList() ??
              []);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Uint8List> _urlToUint8List(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      final bytes = response.bodyBytes;
      return bytes;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
