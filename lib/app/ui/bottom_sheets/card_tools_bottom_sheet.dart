import 'dart:math';

import 'package:digicard/app/extensions/color.dart';
import 'package:digicard/app/ui/widgets/bottom_sheet_buttons.dart';
import 'package:digicard/app/ui/overlays/custom_overlay.dart';
import 'package:digicard/app/ui/bottom_sheets/card_tools_bottom_sheet_viewmodel.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
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

          final color = HexColor.fromHex("${viewModel.card.color}");

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
                      color: color,
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
                            EzText.title1("${viewModel.card.title}",
                                align: TextAlign.center),
                            vSpaceRegular,
                            Row(
                              children: [
                                PanelButtons(
                                  color: color,
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
                                  color: color,
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
                                  color: color,
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
                                  color: color,
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
                                    color: color,
                                    onTap: () async {
                                      await viewModel.duplicate(request.data);
                                    },
                                    icon: const Icon(FontAwesomeIcons.copy),
                                    title: "Dupicate"),
                                hSpaceSmall,
                                MinButtons(
                                    color: color,
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
                                    color: color,
                                    onTap: () async {
                                      await viewModel.delete(request.data.id);
                                    },
                                    icon: const Icon(FontAwesomeIcons.trash),
                                    title: "Delete"),
                                hSpaceSmall,
                                MinButtons(
                                    color: color,
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
