import 'dart:math';

import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../features/create_card/viewmodels/digital_card_view_model.dart';

//1. Create name/alias of custom dialog
enum BottomSheetType { codeVerification, digitalCard, send, z }

Future<void> setupBottomSheetUI() async {
  final bottomSheetService = locator<BottomSheetService>();

//2. Add it on builders
  final builders = {
    BottomSheetType.digitalCard: (context, sheetRequest, completer) =>
        _DigitalCardPage(
          request: sheetRequest,
          completer: completer,
          key: UniqueKey(),
        ),
    BottomSheetType.send: (context, sheetRequest, completer) => _SendPage(
          request: sheetRequest,
          completer: completer,
          key: UniqueKey(),
        ),
  };
  bottomSheetService.setCustomSheetBuilders(builders);
}

class DuplicatingOverlay extends StatelessWidget {
  const DuplicatingOverlay({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: CircularProgressIndicator(),
            ),
            SizedBox(height: 12),
            Text(
              'Duplicating...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
}

class DownloadQROverlay extends StatelessWidget {
  const DownloadQROverlay({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: CircularProgressIndicator(),
            ),
            SizedBox(height: 12),
            Text(
              'Downloading QR...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
}

class _DigitalCardPage extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const _DigitalCardPage({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DigitalCardViewModel>.reactive(
        key: UniqueKey(),
        viewModelBuilder: () => DigitalCardViewModel(),
        builder: (context, viewModel, child) {
          if (viewModel.busy(duplicateBusyKey)) {
            context.loaderOverlay.show(widget: const DuplicatingOverlay());
          } else if (viewModel.busy(downloadQRBusyKey)) {
            context.loaderOverlay.show(widget: const DownloadQROverlay());
          } else {
            context.loaderOverlay.hide();
          }

          return ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.red,
                      height: 25,
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          width: 50,
                          height: 5,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: max(
                                (MediaQuery.of(context).size.width - 500) / 2,
                                15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            EzText.title1("${request.data.title}",
                                align: TextAlign.center),
                            vSpaceRegular,
                            Row(
                              children: [
                                _PanelButtons(
                                  onTap: () {
                                    viewModel.send();
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.paperPlane,
                                    size: 36,
                                  ),
                                  title: "SEND",
                                  subtitle:
                                      "Send via QR, Email, Text and more.",
                                ),
                                hSpaceSmall,
                                _PanelButtons(
                                  onTap: () {},
                                  icon: const Icon(
                                    FontAwesomeIcons.eye,
                                    size: 36,
                                  ),
                                  title: "VIEW",
                                  subtitle: "Open your card in Digicard.",
                                ),
                              ],
                            ),
                            vSpaceSmall,
                            Row(
                              children: [
                                _PanelButtons(
                                  onTap: () {},
                                  icon: const Icon(
                                    FontAwesomeIcons.penToSquare,
                                    size: 36,
                                  ),
                                  title: "EDIT",
                                  subtitle: "Customize your business card.",
                                ),
                                hSpaceSmall,
                                _PanelButtons(
                                  onTap: () {},
                                  icon: const Icon(
                                    FontAwesomeIcons.clipboardQuestion,
                                    size: 36,
                                  ),
                                  title: "TEST",
                                  subtitle:
                                      "See what your card looks like on others.",
                                ),
                              ],
                            ),
                            vSpaceSmall,
                            Row(
                              children: [
                                _MinButtons(
                                    onTap: () async {
                                      await viewModel
                                          .downloadWithoutLogo(context);
                                    },
                                    icon: const Icon(FontAwesomeIcons.qrcode),
                                    title: "Download QR"),
                                hSpaceSmall,
                                _MinButtons(
                                    onTap: () {},
                                    icon:
                                        const Icon(FontAwesomeIcons.nfcSymbol),
                                    title: "Write to NFC"),
                              ],
                            ),
                            vSpaceSmall,
                            Row(
                              children: [
                                _MinButtons(
                                    onTap: () async {
                                      await viewModel.duplicate(request.data);
                                    },
                                    icon: const Icon(FontAwesomeIcons.copy),
                                    title: "Dupicatee"),
                                hSpaceSmall,
                                _MinButtons(
                                    onTap: () {},
                                    icon: const Icon(
                                        FontAwesomeIcons.arrowsLeftRight),
                                    title: "Transfer"),
                              ],
                            ),
                            vSpaceSmall,
                            Row(
                              children: [
                                _MinButtons(
                                    onTap: () {},
                                    icon: const Icon(FontAwesomeIcons.gear),
                                    title: "Settings"),
                                hSpaceSmall,
                                _MinButtons(
                                    onTap: () async {
                                      await viewModel.delete(request.data.id);
                                    },
                                    icon: const Icon(FontAwesomeIcons.trash),
                                    title: "Delete"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class _SendPage extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const _SendPage({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DigitalCardViewModel>.reactive(
        viewModelBuilder: () => DigitalCardViewModel(),
        builder: (context, viewModel, child) {
          if (viewModel.busy(duplicateBusyKey)) {
            context.loaderOverlay.show(widget: const DuplicatingOverlay());
          } else if (viewModel.busy(downloadQRBusyKey)) {
            context.loaderOverlay.show(widget: const DownloadQROverlay());
          } else {
            context.loaderOverlay.hide();
          }

          return SafeArea(
            child: Scaffold(
              body: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.red,
                          height: 25,
                          child: Center(
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              width: 50,
                              height: 5,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: max(
                                    (MediaQuery.of(context).size.width - 500) /
                                        2,
                                    15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Screenshot(
                                    key: UniqueKey(),
                                    controller:
                                        viewModel.screenshotControllerShare,
                                    child: QrImage(
                                      data: 'This is a simple QR code',
                                      version: QrVersions.auto,
                                      embeddedImage: const AssetImage(
                                          'assets/images/splash.png'),
                                      embeddedImageStyle: QrEmbeddedImageStyle(
                                        color: Colors.red,
                                        size: const Size(80, 80),
                                      ),
                                      eyeStyle: const QrEyeStyle(
                                          eyeShape: QrEyeShape.circle,
                                          color: Colors.black),
                                      size: 250,
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.orange,
                                      gapless: false,
                                    ),
                                  ),
                                ),
                                vSpaceRegular,
                                const Text("Point your camera at the QR Code."),
                                vSpaceRegular,
                                Row(
                                  children: [
                                    _MinButtons(
                                        onTap: () async {
                                          await viewModel.share();
                                        },
                                        icon:
                                            const Icon(FontAwesomeIcons.share),
                                        title: "Share"),
                                  ],
                                ),
                                vSpaceSmall,
                                Row(
                                  children: [
                                    _MinButtons(
                                        onTap: () async {
                                          await viewModel.downloadWithLogo();
                                        },
                                        icon: const Icon(
                                            FontAwesomeIcons.download),
                                        title: "Download QR"),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class _PanelButtons extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  final Function onTap;
  const _PanelButtons(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.zero,
        color: Colors.red.withOpacity(0.3),
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            width: 160,
            height: 150,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icon,
                EzText.title1(title, align: TextAlign.center),
                EzText.caption(
                  subtitle,
                  align: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MinButtons extends StatelessWidget {
  final Icon icon;
  final String title;
  final Function onTap;
  const _MinButtons({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.zero,
        color: Colors.red.withOpacity(0.3),
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            width: 160,
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                hSpaceSmall,
                EzText.caption(title, align: TextAlign.left),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
