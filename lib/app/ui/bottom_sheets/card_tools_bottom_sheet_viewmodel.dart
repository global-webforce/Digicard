import 'dart:io';

import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card.model.dart';
import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.snackbar_ui.dart';
import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:digicard/app/views/card_edit_after_duplicate/card_edit_after_duplicate_view.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/views/card_open/card_open_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dart:ui' as ui;

const String duplicateBusyKey = 'duplicate-busy-key';
const String downloadQRBusyKey = 'downloadQR-busy-key';

class CardToolsBottomSheetViewModel extends ReactiveViewModel {
  final log = getLogger('CardToolsBottomSheetViewModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();

  final _digitalCardsService = locator<DigitalCardService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardsService];

  List<DigitalCard> get digitalCards => _digitalCardsService.digitalCards;

  Future<DialogResponse<dynamic>?> delete(int? id) async {
    _dialogService
        .showCustomDialog(
      variant: DialogType.confirmation,
      title: "Card Delete",
      description: "You sure you want to delete this card?",
      mainButtonTitle: "Cancel",
      secondaryButtonTitle: "Delete",
      barrierDismissible: true,
    )
        .then((value) {
      if (value!.confirmed) {
        _digitalCardsService.delete(id);
        _bottomSheetService.completeSheet(SheetResponse());
      }
      return value;
    });
    return null;
  }

  send() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.send,
      isScrollControlled: true,
    );
  }

  view(DigitalCard card) {
    _navigationService.navigateToView(CardOpenView(
      card: card,
    ));
  }

  show(DigitalCard digitalCard) async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.digitalCard,
      data: digitalCard,
      isScrollControlled: true,
      useRootNavigator: false,
    );
  }

  duplicate(DigitalCard digitalCard) async {
    setBusyForObject(duplicateBusyKey, true);
    _digitalCardsService.duplicate(digitalCard);

    await Future.delayed(const Duration(seconds: 1));
    setBusyForObject(duplicateBusyKey, false);
    _bottomSheetService.completeSheet(SheetResponse());
    await _navigationService.navigateToView(AddDigitalCardPage(digitalCard));
  }

  //Create an instance of ScreenshotController
  ScreenshotController screenshotControllerShare = ScreenshotController();
  ScreenshotController screenshotControllerDownload = ScreenshotController();

  Future<void> share() async {
    await screenshotControllerShare
        .capture(
      pixelRatio: 10,
    )
        .then((Uint8List? image) async {
      final tempDir = await getTemporaryDirectory();
      File file = await File('${tempDir.path}/mamaloan.png').create();
      file.writeAsBytesSync(List<int>.from(image!.toList()));
      XFile filex = XFile(file.path);
      Share.shareXFiles([filex]);
    }).catchError((onError) {});
  }

  Future<void> downloadWithLogo() async {
    setBusyForObject(downloadQRBusyKey, true);
    dynamic result;
    Uint8List? image = await screenshotControllerShare.capture(
      pixelRatio: 10,
    );

    if (image != null) {
      result = await ImageGallerySaver.saveImage(
        image,
        quality: 60,
        name: "${DateTime.now().microsecondsSinceEpoch}_hello",
      );
    }
    setBusyForObject(downloadQRBusyKey, false);
    if (result["isSuccess"] == true) {
      rebuildUi();
      _snackbarService.showCustomSnackBar(
        message: "QR Code saved to Gallery",
        duration: const Duration(seconds: 2),
        variant: SnackbarType.successful,
      );
    }
  }

  Future<void> downloadWithoutLogo(BuildContext context) async {
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
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);
      XFile filex = XFile(file.path);
      Share.shareXFiles([filex]);

      print("CAPTURED");
    } catch (e) {
      print(e.toString());
    }
  }
}
