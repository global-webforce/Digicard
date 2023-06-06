import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/constants/env.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/ui/bottom_sheets/bs.card_send_viewmodel.dart';
import 'package:digicard/app/ui/overlays/loader_overlay_wrapper.dart';
import 'package:digicard/app/ui/widgets/bottom_sheet_buttons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

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
    return ViewModelBuilder<CardSendBottomSheetViewModel>.reactive(
        viewModelBuilder: () => CardSendBottomSheetViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.card = request.data;
          viewModel.context = context;
        },
        builder: (context, viewModel, child) {
          final colorTheme = viewModel.card.color != null
              ? Color(viewModel.card.color ?? kcPrimaryColorInt)
              : Theme.of(context).primaryColor;

          LoadingType? loadingType;
          if (viewModel.busy(saveToContactsBusyKey)) {
            loadingType = LoadingType.save;
          } else if (viewModel.busy(downloadQRBusyKey)) {
            loadingType = LoadingType.download;
          } else if (viewModel.busy(shareBusyKey)) {
            loadingType = LoadingType.basic;
          }

          return LoaderOverlayWrapper(
              type: loadingType,
              builder: (context) {
                return SafeArea(
                  child: ClipRRect(
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
                              color: colorTheme.darken(0.2),
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
                                        (MediaQuery.of(context).size.width -
                                                500) /
                                            2,
                                        15)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Screenshot(
                                      key: UniqueKey(),
                                      controller:
                                          viewModel.screenshotControllerShare,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        fit: StackFit.loose,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: QrImage(
                                              data:
                                                  "https://markbulingit.github.io/#/p/${request.data.uuid}",
                                              version: QrVersions.auto,
                                              errorCorrectionLevel:
                                                  QrErrorCorrectLevel.M,
                                              size: 200,
                                              foregroundColor: Colors.black,
                                              backgroundColor: Colors.white,
                                              gapless: true,
                                            ),
                                          ),
                                          Positioned(
                                            child: Center(
                                              child: Container(
                                                color: Colors.white,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  child: CachedNetworkImage(
                                                      imageUrl:
                                                          "$logoUrlPrefix${request.data.logoUrl}",
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Image(
                                                            image:
                                                                imageProvider,
                                                            width: 45,
                                                            height: 45,
                                                          ),
                                                      placeholder:
                                                          (context, url) {
                                                        return const SizedBox
                                                            .shrink();
                                                      },
                                                      errorWidget: (context,
                                                          url, error) {
                                                        return const SizedBox
                                                            .shrink();
                                                      }),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    vSpaceRegular,
                                    const Text(
                                        "Point your camera at the QR Code."),
                                    vSpaceRegular,
                                    Row(
                                      children: [
                                        MinButtons(
                                            color: colorTheme,
                                            onTap: (kIsWeb)
                                                ? null
                                                : () async {
                                                    await viewModel.share();
                                                  },
                                            trailing: (!kIsWeb)
                                                ? null
                                                : Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: colorTheme
                                                          .darken(0.2),
                                                    ),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 4,
                                                        horizontal: 12),
                                                    child: const Text("Mobile"),
                                                  ),
                                            icon: const Icon(
                                                FontAwesomeIcons.share),
                                            title: "Share"),
                                      ],
                                    ),
                                    vSpaceSmall,
                                    Row(
                                      children: [
                                        MinButtons(
                                            color: colorTheme,
                                            onTap: () async {
                                              await viewModel
                                                  .downloadWithLogo();
                                            },
                                            icon: const Icon(
                                                FontAwesomeIcons.download),
                                            title: "Download QR"),
                                      ],
                                    ),
                                    vSpaceSmall,
                                    Row(
                                      children: [
                                        MinButtons(
                                            color: colorTheme,
                                            onTap: () async {
                                              await viewModel
                                                  .saveToDeviceContacts();
                                            },
                                            icon: const Icon(
                                                FontAwesomeIcons.addressBook),
                                            title: "Save Contact"),
                                      ],
                                    ),
                                    vSpaceSmall,
                                    Row(
                                      children: [
                                        MinButtons(
                                            color: colorTheme,
                                            onTap: () async {
                                              await Clipboard.setData(ClipboardData(
                                                  text:
                                                      "https://markbulingit.github.io/#/p/${request.data.uuid}"));
                                            },
                                            icon: const Icon(
                                                FontAwesomeIcons.copy),
                                            title: "Copy Link"),
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
                );
              });
        });
  }
}
