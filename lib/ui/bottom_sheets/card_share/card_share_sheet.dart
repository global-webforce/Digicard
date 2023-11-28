import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/ui/bottom_sheets/bottom_sheet_wrapper.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/widgets/overlays/loader_overlay_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'card_share_sheet_model.dart';

class CardShareSheet extends StackedView<CardShareSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const CardShareSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CardShareSheetModel viewModel,
    Widget? child,
  ) {
    final colorTheme = viewModel.card.color ?? kcPrimaryColor;
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
        child: Column(
          children: [
            QrImageView(
              data: DigitalCardDTOExtension.convertToContact(viewModel.card)!
                  .toVCard(withPhoto: false),
              version: QrVersions.auto,
              errorCorrectionLevel: QrErrorCorrectLevel.M,
              size: 200,
              eyeStyle: const QrEyeStyle(
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              gapless: true,
            ),
          ],
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
                  imageUrl: viewModel.card.logoHttpUrl,
                  imageBuilder: (context, imageProvider) => Image(
                        image: imageProvider,
                        width: 200 * 0.16,
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
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.loose,
                    children: [
                      qrCode(),
                      logo(),
                    ],
                  ),
                ),
              ),
              vSpaceRegular,
              const Text("Point your camera at the QR Code."),
              vSpaceSmall,
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
                    await viewModel.downloadWithLogo(context);
                  },
                  icon: const Icon(FontAwesomeIcons.qrcode),
                  title: "Download QR"),
              vSpaceSmall,
              PanelButton(
                  color: colorTheme,
                  onTap: () async {
                    await viewModel.downloadVcf();
                  },
                  icon: const Icon(FontAwesomeIcons.addressCard),
                  title: "Download VCF"),
              vSpaceSmall,
              PanelButton(
                  color: colorTheme,
                  onTap: () async {
                    await Clipboard.setData(
                        ClipboardData(text: viewModel.card.cardHttpUrl));
                  },
                  icon: const Icon(FontAwesomeIcons.copy),
                  title: "Copy Link")
            ],
          );
        });
  }

  @override
  CardShareSheetModel viewModelBuilder(BuildContext context) =>
      CardShareSheetModel();

  @override
  void onViewModelReady(CardShareSheetModel viewModel) {
    viewModel.card = request.data;
    super.onViewModelReady(viewModel);
  }
}
