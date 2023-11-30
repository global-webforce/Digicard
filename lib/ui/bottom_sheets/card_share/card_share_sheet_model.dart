import 'dart:io';

import 'package:digicard/app/app.dialogs.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/services/native_contacts_service.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:flutter/foundation.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

class CardShareSheetModel extends ReactiveViewModel {
  final log = getLogger('CardShareSheetModel');
  final _dialogService = locator<DialogService>();
  final _digitalCardsService = locator<DigitalCardService>();
  final _nativeContactsService = locator<NativeContactsService>();

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    {
      _dialogService.showCustomDialog(
          variant: DialogType.error,
          barrierDismissible: true,
          description: error.toString());
    }
    super.onFutureError(error, key);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardsService];

  late DigitalCardDTO card;

  ScreenshotController screenshotControllerShare = ScreenshotController();
  ScreenshotController screenshotControllerDownload = ScreenshotController();

  Future<void> share() async {
    setBusyForObject(shareBusyKey, true);
    try {
      await screenshotControllerShare
          .capture(
        pixelRatio: 10,
      )
          .then((Uint8List? image) async {
        var uuid = const Uuid();
        final tempDir = await getTemporaryDirectory();
        File file = await File(
                '${tempDir.path}/${uuid.v5(Uuid.NAMESPACE_URL, 'www.digicard.com')}.png')
            .create();
        file.writeAsBytesSync(List<int>.from(image!.toList()));
        XFile filex = XFile(file.path);
        Share.shareXFiles([filex]);
      });
    } catch (e) {
      log.e(e.toString());
    }

    setBusyForObject(shareBusyKey, false);
  }

  Future downloadWithLogo(BuildContext context) async {
    dynamic result;
    try {
      final Uint8List? image = await screenshotControllerShare.capture(
          pixelRatio: 10, delay: const Duration(milliseconds: 200));

      if (image != null) {
        if (!kIsWeb) {
          result = await ImageGallerySaver.saveImage(
            image,
            quality: 60,
            name: card.uuid,
          );
        } else {
          await WebImageDownloader.downloadImageFromUInt8List(
            name: '${card.uuid}.jpg',
            uInt8List: image,
          );

          result = {"isSuccess": true};
        }
      }
    } catch (e) {
      log.e(e.toString());
    }

    if (result["isSuccess"] == true) {
      //Show Success Prompt
    }
  }

  Future saveToDeviceContacts() async {
    try {
      await _nativeContactsService.save(card).then((value) {
        //Show Success Prompt
      });
    } catch (e) {
      log.e(e.toString());
    }
  }

  Future downloadVcf() async {
    try {
      await _nativeContactsService.downloadVCF(card).then((value) {
        //Show Success Prompt
      });
    } catch (e) {
      log.e(e.toString());
    }
  }
}
