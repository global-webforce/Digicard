import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/ui/overlays/loader_overlay_wrapper.dart';
import 'package:digicard/app/ui/bottom_sheets/bs.card_manager_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'bottom_sheet_wrapper.dart';

class CardManagerBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const CardManagerBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardManagerBottomSheetViewModel>.reactive(
        viewModelBuilder: () => CardManagerBottomSheetViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.card = request.data;
          viewModel.context = context;
        },
        builder: (context, viewModel, child) {
          final colorTheme = Color(viewModel.card.color ?? kcPrimaryColorInt);

          LoadingType? loadingType;
          if (viewModel.busy(duplicateBusyKey)) {
            loadingType = LoadingType.duplicate;
          } else if (viewModel.busy(downloadQRBusyKey)) {
            loadingType = LoadingType.download;
          } else if (viewModel.busy(deleteBusyKey)) {
            loadingType = LoadingType.delete;
          }

          return LoaderOverlayWrapper(
              type: loadingType,
              builder: (context) {
                return BottomSheetWrapper(notchColor: colorTheme, children: [
                  Text(
                    "${viewModel.card.title}",
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  vSpaceRegular,
                  Row(
                    children: [
                      Expanded(
                        child: PanelButton.big(
                          color: colorTheme,
                          onTap: () {
                            viewModel.send();
                          },
                          icon: const Icon(
                            FontAwesomeIcons.paperPlane,
                            size: 36,
                          ),
                          title: "SEND",
                          subtitle: "Send via QR, Email, Text and more.",
                        ),
                      ),
                      hSpaceSmall,
                      Expanded(
                        child: PanelButton.big(
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
                      ),
                    ],
                  ),
                  vSpaceSmall,
                  Row(
                    children: [
                      Expanded(
                        child: PanelButton.big(
                          color: colorTheme,
                          onTap: () {
                            viewModel.edit(request.data);
                          },
                          icon: const Icon(
                            FontAwesomeIcons.penToSquare,
                            size: 36,
                          ),
                          title: "EDIT",
                          subtitle: "Customize your business card.",
                        ),
                      ),
                      hSpaceSmall,
                      Expanded(
                        child: PanelButton.big(
                          color: colorTheme,
                          icon: const Icon(
                            FontAwesomeIcons.gear,
                            size: 36,
                          ),
                          title: "SETTINGS",
                          subtitle: "Tweak your card settings",
                        ),
                      ),
                    ],
                  ),
                  vSpaceSmall,
                  Row(
                    children: [
                      Expanded(
                        child: PanelButton(
                            color: colorTheme,
                            onTap: () async {
                              await viewModel.duplicate(request.data);
                            },
                            icon: const Icon(FontAwesomeIcons.copy),
                            title: "Duplicate"),
                      ),
                      hSpaceSmall,
                      Expanded(
                        child: PanelButton(
                            color: colorTheme,
                            onTap: () async {
                              await viewModel.delete(request.data.id);
                            },
                            icon: const Icon(FontAwesomeIcons.trash),
                            title: "Delete"),
                      ),
                    ],
                  ),
                ]);
              });
        });
  }
}
