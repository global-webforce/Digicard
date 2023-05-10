import 'dart:io';

import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/services/contacts_service.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_html/js.dart' as js;
import 'package:uuid/uuid.dart';

const String downloadQRBusyKey = 'downloadQRBusyKey';
const String shareBusyKey = 'shareBusyKey';
const String saveToContactsBusyKey = 'saveToContactsBusyKey';
const String doneBusyKey = 'doneBusyKey';

class CardSendBottomSheetViewModel extends ReactiveViewModel {
  final log = getLogger('CardSendBottomSheetViewModel');
  final _dialogService = locator<DialogService>();
  final _digitalCardsService = locator<DigitalCardService>();
  final _contactsService = locator<ContactsService>();

  showDoneOverlay() async {
    setBusyForObject(doneBusyKey, true);
    await Future.delayed(const Duration(seconds: 1));
    setBusyForObject(doneBusyKey, false);
  }

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

  late BuildContext context;
  late DigitalCard card;

  ScreenshotController screenshotControllerShare = ScreenshotController();
  ScreenshotController screenshotControllerDownload = ScreenshotController();

  Future<void> share() async {
    setBusyForObject(shareBusyKey, true);

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
    }).catchError((onError) {});
    setBusyForObject(shareBusyKey, false);
  }

  Future downloadWithLogo() async {
    setBusyForObject(downloadQRBusyKey, true);

    dynamic result;
    Uint8List? image = await screenshotControllerShare.capture(
      pixelRatio: 10,
    );

    if (image != null) {
      if (!kIsWeb) {
        result = await ImageGallerySaver.saveImage(
          image,
          quality: 60,
          name: "${card.uuid}",
        );
      } else {
        js.context.callMethod("saveAs", <Object>[
          html.Blob(<Object>[image]),
          '${card.uuid}.png'
        ]);
      }
    }

    setBusyForObject(downloadQRBusyKey, false);
    if (result["isSuccess"] == true) {
      await showDoneOverlay();
    }
  }

  Future saveToContacts() async {
    setBusyForObject(saveToContactsBusyKey, true);
    await _contactsService.save(card);
    setBusyForObject(saveToContactsBusyKey, false);
    await showDoneOverlay();
  }

/*   Future downloadWithoutLogo(BuildContext context) async {
    setBusyForObject(downloadQRBusyKey, true);

    final widget = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: QrImage(
        data: 'This is a simple QR code',
        version: QrVersions.auto,
        embeddedImage: const AssetImage('assets/images/splash.png'),
        embeddedImageStyle: QrEmbeddedImageStyle(
          color: Colors.red,
          size: const Size(80, 80),
        ),
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.circle,
          color: Colors.black,
        ),
        size: 250,
        foregroundColor: Colors.white,
        backgroundColor: kcPrimaryColor,
        gapless: false,
      ),
    );
    Uint8List? image;
    dynamic result;
    if (context.mounted) {
      image = await screenshotControllerDownload.captureFromWidget(
        widget,
        pixelRatio: 10,
        context: context,
      );
    }
    if (image != null) {
      result = await ImageGallerySaver.saveImage(
        image,
        quality: 60,
        name: "${DateTime.now().microsecondsSinceEpoch}_hello",
      );
    }

    setBusyForObject(downloadQRBusyKey, false);
    if (result != null) {
      if (result["isSuccess"] == true) {
        _snackbarService.showCustomSnackBar(
            message: "QR Code saved to Gallery",
            duration: const Duration(seconds: 2),
            variant: SnackbarType.successful);
      }
    }
  }

  /// Converts the widget into bytes(image) to be shared or downloaded
  Future<dynamic> createImageFromWidget(Widget widget,
      {Duration? wait, Size? logicalSize, Size? imageSize}) async {
    try {
      final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

      logicalSize ??= ui.window.physicalSize / ui.window.devicePixelRatio;
      imageSize ??= ui.window.physicalSize;

      assert(logicalSize.aspectRatio == imageSize.aspectRatio);

      final RenderView renderView = RenderView(
        window: ui.window,
        child: RenderPositionedBox(
            alignment: Alignment.center, child: repaintBoundary),
        configuration: ViewConfiguration(
          size: logicalSize,
          devicePixelRatio: 1.0,
        ),
      );

      final PipelineOwner pipelineOwner = PipelineOwner();

      final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

      pipelineOwner.rootNode = renderView;
      renderView.prepareInitialFrame();

      final RenderObjectToWidgetElement<RenderBox> rootElement =
          RenderObjectToWidgetAdapter<RenderBox>(
        container: repaintBoundary,
        child: widget,
      ).attachToRenderTree(buildOwner);

      buildOwner.buildScope(rootElement);

      if (wait != null) {
        await Future.delayed(wait);
      }

      buildOwner.buildScope(rootElement);
      buildOwner.finalizeTree();

      pipelineOwner.flushLayout();
      pipelineOwner.flushCompositingBits();
      pipelineOwner.flushPaint();

      final ui.Image image = await repaintBoundary.toImage(pixelRatio: 10.0);
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      final Uint8List pngBytes = byteData!.buffer.asUint8List();

      try {
        if (!kIsWeb) {
          final tempDir = await getTemporaryDirectory();
          final file = await File('${tempDir.path}/${card.uuid}.png').create();
          await file.writeAsBytes(pngBytes);
          XFile filex = XFile(file.path);
          Share.shareXFiles([filex]);
        } else {
          js.context.callMethod("saveAs", <Object>[
            html.Blob(<Object>[pngBytes]),
            '${card.uuid}.png'
          ]);
        }
      } catch (e) {
        log.e("createImageFromWidget() method failed: ${e.toString()}");
      }
    } catch (e) {
      rethrow;
    }
  } */
}
