import 'dart:convert';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_ez_core/helpers/image_cache_downloader.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_html/js.dart' as js;

class NativeContactsService with ListenableServiceMixin {
  /// Saves Contact to native contact app of mobile
  Future save(DigitalCardDTO card) async {
    try {
      final contact = DigitalCardDTOExtension.convertToContact(card);
      Uint8List? image = await imageCacheDownload(card.avatarHttpUrl);
      contact?.photo = image;
      if (contact != null) {
        if (!kIsWeb) {
          if (await FlutterContacts.requestPermission()) {
            contact.insert();
          }
        }
      }
    } catch (e) {
      Future.error(e.toString());
    }
  }

  /// Saves Contact as .vcf file
  Future downloadVCF(DigitalCardDTO card) async {
    try {
      final contact = DigitalCardDTOExtension.convertToContact(card);
      Uint8List? image = await imageCacheDownload(card.avatarHttpUrl);
      contact?.photo = image;
      if (contact != null) {
        if (kIsWeb) {
          final bytes = utf8.encode(
            contact.toVCard(
              withPhoto: true,
              includeDate: true,
            ),
          );

          js.context.callMethod("saveAs", <Object>[
            html.Blob(<Object>[bytes]),
            '${card.uuid}.vcf'
          ]);
        }
      }
    } catch (e) {
      Future.error(e.toString());
    }
  }
}
