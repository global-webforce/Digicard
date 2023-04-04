import 'dart:io';

import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.snackbar_ui.dart';
import 'package:digicard/app/services/contacts_service.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/views/card_open/card_open_view.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
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

import 'package:uuid/uuid.dart';

const String duplicateBusyKey = 'duplicateBusyKey';
const String downloadQRBusyKey = 'downloadQRBusyKey';
const String deleteBusyKey = 'deleteBusyKey';
const String shareBusyKey = 'shareBusyKey';
const String saveToContactsBusyKey = 'saveToContactsBusyKey';
const String doneBusyKey = 'doneBusyKey';

class CardToolsBottomSheetViewModel extends ReactiveViewModel {
  final log = getLogger('CardToolsBottomSheetViewModel');
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _digitalCardsService = locator<DigitalCardService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _contactsService = locator<ContactsService>();

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

  delete(int? id) async {
    final value = await _dialogService.showCustomDialog(
      variant: DialogType.confirmation,
      title: "Card Delete",
      description: "You sure you want to delete this card?",
      mainButtonTitle: "Cancel",
      secondaryButtonTitle: "Delete",
      barrierDismissible: true,
    );
    if (value!.confirmed) {
      await runBusyFuture(_digitalCardsService.delete(card),
          busyObject: deleteBusyKey, throwException: true);
      _bottomSheetService.completeSheet(SheetResponse());
    }
    return null;
  }

  send() {
    _bottomSheetService.completeSheet(SheetResponse());
    _bottomSheetService.showCustomSheet(
      ignoreSafeArea: false,
      variant: BottomSheetType.send,
      data: card,
      isScrollControlled: true,
    );
  }

  view(DigitalCard card) {
    _bottomSheetService.completeSheet(SheetResponse());
    _navigationService.navigateToView(
      CardOpenView(
        actionType: ActionType.view,
        card: card,
      ),
      transitionStyle: Transition.fade,
      curve: Curves.easeIn,
    );
  }

  update(DigitalCard card) {
    _bottomSheetService.completeSheet(SheetResponse());
    _navigationService.navigateToView(
      CardOpenView(
        actionType: ActionType.edit,
        card: card,
      ),
      transitionStyle: Transition.rightToLeftWithFade,
      curve: Curves.easeIn,
    );
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
    _bottomSheetService.completeSheet(SheetResponse());
    _navigationService.navigateToView(
      CardOpenView(
        actionType: ActionType.duplicate,
        card: digitalCard.copyWith(title: "${digitalCard.title} Copy"),
      ),
      transitionStyle: Transition.zoom,
      curve: Curves.easeIn,
    );
  }

  //Create an instance of ScreenshotController
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
    await _contactsService.saveContact(card);
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
      setBusyForObject(downloadQRBusyKey, false);
      setBusyForObject(doneBusyKey, true);
      await Future.delayed(const Duration(seconds: 1));
      setBusyForObject(doneBusyKey, false);
    }
  }

  Future saveToContacts() async {
    setBusyForObject(saveToContactsBusyKey, true);
    await _contactsService.saveContact(card);
    setBusyForObject(saveToContactsBusyKey, false);
    setBusyForObject(doneBusyKey, true);
    await Future.delayed(const Duration(seconds: 1));
    setBusyForObject(doneBusyKey, false);
    _snackbarService.showSnackbar(message: "TESTING!");
  }

  Future downloadWithoutLogo(BuildContext context) async {
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
    } catch (e) {}
  }
}
