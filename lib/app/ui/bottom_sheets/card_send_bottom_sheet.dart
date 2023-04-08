import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/ui/widgets/bottom_sheet_buttons.dart';
import 'package:digicard/app/ui/overlays/custom_overlay.dart';
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
        onViewModelReady: (viewModel) {
          viewModel.card = request.data;
          viewModel.context = context;
        },
        builder: (context, viewModel, child) {
          final colorTheme = viewModel.card.color != null
              ? Color(viewModel.card.color ?? kcPrimaryColorInt)
              : Theme.of(context).primaryColor;

          if (viewModel.busy(duplicateBusyKey)) {
            context.loaderOverlay
                .show(widget: const CustomOverlay(title: "Duplicating..."));
          } else if (viewModel.busy(downloadQRBusyKey)) {
            context.loaderOverlay
                .show(widget: const CustomOverlay(title: "Downloading..."));
          } else if (viewModel.busy(deleteBusyKey)) {
            context.loaderOverlay
                .show(widget: const CustomOverlay(title: "Deleting..."));
          } else if (viewModel.busy(shareBusyKey)) {
            context.loaderOverlay
                .show(widget: const CustomOverlay(title: "Loading options..."));
          } else if (viewModel.busy(saveToContactsBusyKey)) {
            context.loaderOverlay.show(
                widget: const CustomOverlay(title: "Saving to Contacts..."));
          } else if (viewModel.busy(doneBusyKey)) {
            context.loaderOverlay.show(
              widget: DoneOverlay(context, title: "Done!"),
            );
          } else {
            context.loaderOverlay.hide();
          }

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
                        color: colorTheme,
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Screenshot(
                                  key: UniqueKey(),
                                  controller:
                                      viewModel.screenshotControllerShare,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    fit: StackFit.loose,
                                    children: [
                                      QrImage(
                                        data:
                                            "https://www.digicard.com/me/${viewModel.card.uuid}",
                                        version: QrVersions.auto,
                                        size: 250,
                                        foregroundColor: Colors.white,
                                        backgroundColor: colorTheme,
                                        gapless: false,
                                      ),
                                      Positioned(
                                        child: Center(
                                          child: Container(
                                            color: Colors.white,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: CachedNetworkImage(
                                                  imageUrl:
                                                      "${viewModel.card.logoUrl}",
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Image(
                                                        image: imageProvider,
                                                        width: 60,
                                                      ),
                                                  placeholder: (context, url) {
                                                    return const SizedBox
                                                        .shrink();
                                                  },
                                                  errorWidget:
                                                      (context, url, error) {
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
                              ),
                              vSpaceRegular,
                              const Text("Point your camera at the QR Code."),
                              vSpaceRegular,
                              Row(
                                children: [
                                  MinButtons(
                                      color: colorTheme,
                                      onTap: () async {
                                        await viewModel.share();
                                      },
                                      icon: const Icon(FontAwesomeIcons.share),
                                      title: "Share"),
                                ],
                              ),
                              vSpaceSmall,
                              Row(
                                children: [
                                  MinButtons(
                                      color: colorTheme,
                                      onTap: () async {
                                        await viewModel.downloadWithLogo();
                                      },
                                      icon:
                                          const Icon(FontAwesomeIcons.download),
                                      title: "Download QR"),
                                ],
                              ),
                              vSpaceSmall,
                              Row(
                                children: [
                                  MinButtons(
                                      color: colorTheme,
                                      onTap: () async {
                                        await viewModel.saveToContacts();
                                      },
                                      icon: const Icon(
                                          FontAwesomeIcons.addressBook),
                                      title: "Save to Contacts"),
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
  }
}
