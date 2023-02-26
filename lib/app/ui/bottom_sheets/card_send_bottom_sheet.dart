import 'dart:math';

import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:digicard/app/ui/widgets/bottom_sheet_buttons.dart';
import 'package:digicard/app/ui/overlays/card_duplicating_overlay.dart';
import 'package:digicard/app/ui/overlays/qr_code_downloading_overlay.dart';
import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'card_tools_bottom_sheet_viewmodel.dart';

class CardSendBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const CardSendBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardToolsBottomSheetViewModel>.reactive(
        viewModelBuilder: () => CardToolsBottomSheetViewModel(),
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
                                      backgroundColor: kcPrimaryColor,
                                      gapless: false,
                                    ),
                                  ),
                                ),
                                vSpaceRegular,
                                const Text("Point your camera at the QR Code."),
                                vSpaceRegular,
                                Row(
                                  children: [
                                    MinButtons(
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
                                    MinButtons(
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
