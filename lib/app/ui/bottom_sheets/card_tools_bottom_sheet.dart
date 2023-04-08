import 'dart:math';

import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/constants/typography.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/ui/widgets/bottom_sheet_buttons.dart';
import 'package:digicard/app/ui/overlays/custom_overlay.dart';
import 'package:digicard/app/ui/bottom_sheets/card_tools_bottom_sheet_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CardToolsBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const CardToolsBottomSheet({
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
          if (viewModel.busy(duplicateBusyKey)) {
            context.loaderOverlay
                .show(widget: const CustomOverlay(title: "Duplicating..."));
          } else if (viewModel.busy(downloadQRBusyKey)) {
            context.loaderOverlay
                .show(widget: const CustomOverlay(title: "Downloading..."));
          } else if (viewModel.busy(deleteBusyKey)) {
            context.loaderOverlay
                .show(widget: const CustomOverlay(title: "Deleting..."));
          } else {
            context.loaderOverlay.hide();
          }

          final colorTheme = Color(viewModel.card.color ?? kcPrimaryColorInt);

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
                            if ("${viewModel.card.title}".isNotNullOrEmpty())
                              Text("${viewModel.card.title}",
                                  style: headline, textAlign: TextAlign.center),
                            vSpaceRegular,
                            Row(
                              children: [
                                PanelButtons(
                                  color: colorTheme,
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
                                PanelButtons(
                                  color: colorTheme,
                                  onTap: () {
                                    viewModel.view(request.data);
                                  },
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
                                PanelButtons(
                                  color: colorTheme,
                                  onTap: () {
                                    viewModel.update(request.data);
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.penToSquare,
                                    size: 36,
                                  ),
                                  title: "EDIT",
                                  subtitle: "Customize your business card.",
                                ),
                                hSpaceSmall,
                                PanelButtons(
                                  color: colorTheme,
                                  onTap: () {},
                                  icon: const Icon(
                                    FontAwesomeIcons.gear,
                                    size: 36,
                                  ),
                                  title: "SETTINGS",
                                  subtitle: "Tweak your card settings",
                                ),
                              ],
                            ),
                            vSpaceSmall,
                            Row(
                              children: [
                                MinButtons(
                                    color: colorTheme,
                                    onTap: () async {
                                      await viewModel.duplicate(request.data);
                                    },
                                    icon: const Icon(FontAwesomeIcons.copy),
                                    title: "Dupicate"),
                                hSpaceSmall,
                                MinButtons(
                                    color: colorTheme,
                                    onTap: null,
                                    icon:
                                        const Icon(FontAwesomeIcons.nfcSymbol),
                                    title: "Write to NFC"),
                              ],
                            ),
                            vSpaceSmall,
                            Row(
                              children: [
                                MinButtons(
                                    color: colorTheme,
                                    onTap: () async {
                                      await viewModel.delete(request.data.id);
                                    },
                                    icon: const Icon(FontAwesomeIcons.trash),
                                    title: "Delete"),
                                hSpaceSmall,
                                MinButtons(
                                    color: colorTheme,
                                    onTap: null,
                                    icon: const Icon(
                                        FontAwesomeIcons.arrowsLeftRight),
                                    title: "Transfer"),
                              ],
                            ),
                            /*   vSpaceSmall,
                            Row(
                              children: [
                                MinButtons(
                                    color: color,
                                    onTap: () async {
                                      await viewModel
                                          .downloadWithoutLogo(context);
                                    },
                                    icon: const Icon(FontAwesomeIcons.qrcode),
                                    title: "Download QR"),
                                hSpaceSmall,
                                MinButtons(
                                    color: color,
                                    onTap: null,
                                    icon: const Icon(FontAwesomeIcons.gear),
                                    title: "Settings"),
                              ],
                            ) */
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
