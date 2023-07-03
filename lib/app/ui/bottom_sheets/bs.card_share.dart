import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/env/env.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/ui/bottom_sheets/bs.card_share_viewmodel.dart';
import 'package:digicard/app/ui/overlays/loader_overlay_wrapper.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'bottom_sheet_wrapper.dart';

class CardShareBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const CardShareBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardShareBottomSheetViewModel>.reactive(
        viewModelBuilder: () => CardShareBottomSheetViewModel(),
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

          Widget qrCode() {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: QrImage(
                data: "${Env.cardUrl}${request.data.uuid}",
                version: QrVersions.auto,
                errorCorrectionLevel: QrErrorCorrectLevel.M,
                size: 200,
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                gapless: true,
              ),
            );
          }

          Widget logo() {
            return Positioned(
              child: Center(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: CachedNetworkImage(
                        imageUrl:
                            "${Env.supabaseLogoUrl}${request.data.logoUrl}",
                        imageBuilder: (context, imageProvider) => Image(
                              image: imageProvider,
                              width: 45,
                              height: 45,
                            ),
                        placeholder: (context, url) {
                          return const SizedBox.shrink();
                        },
                        errorWidget: (context, url, error) {
                          return const SizedBox.shrink();
                        }),
                  ),
                ),
              ),
            );
          }

          return LoaderOverlayWrapper(
              type: loadingType,
              builder: (context) {
                return BottomSheetWrapper(
                  notchColor: colorTheme,
                  children: [
                    Screenshot(
                      key: UniqueKey(),
                      controller: viewModel.screenshotControllerShare,
                      child: Stack(
                        alignment: Alignment.center,
                        fit: StackFit.loose,
                        children: [
                          qrCode(),
                          logo(),
                        ],
                      ),
                    ),
                    vSpaceRegular,
                    const Text("Point your camera at the QR Code."),
                    vSpaceRegular,
                    if (!kIsWeb)
                      PanelButton(
                        icon: const Icon(FontAwesomeIcons.share),
                        title: "Share",
                        color: colorTheme,
                        onTap: (kIsWeb)
                            ? null
                            : () async {
                                await viewModel.share();
                              },
                      ),
                    vSpaceSmall,
                    PanelButton(
                        color: colorTheme,
                        onTap: () async {
                          await viewModel.downloadWithLogo();
                        },
                        icon: const Icon(FontAwesomeIcons.download),
                        title: "Download QR"),
                    vSpaceSmall,
                    PanelButton(
                        color: colorTheme,
                        onTap: () async {
                          kIsWeb
                              ? await viewModel.downloadVcf()
                              : await viewModel.saveToDeviceContacts();
                        },
                        icon: const Icon(FontAwesomeIcons.addressBook),
                        title: "Save Contact"),
                    vSpaceSmall,
                    PanelButton(
                        color: colorTheme,
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(
                              text: "${Env.cardUrl}${request.data.uuid}"));
                        },
                        icon: const Icon(FontAwesomeIcons.copy),
                        title: "Copy Link")
                  ],
                );
              });
        });
  }
}
