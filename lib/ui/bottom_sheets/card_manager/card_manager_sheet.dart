import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/ui/bottom_sheets/bottom_sheet_wrapper.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/widgets/overlays/loader_overlay_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'card_manager_sheet_model.dart';

class CardManagerSheet extends StackedView<CardManagerSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const CardManagerSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CardManagerSheetModel viewModel,
    Widget? child,
  ) {
    final colorTheme = viewModel.card.color ?? kcPrimaryColor;

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
              viewModel.card.title.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
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
                      viewModel.share();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.paperPlane,
                      size: 36,
                    ),
                    title: "SHARE",
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
                  child: PanelButton(
                      color: colorTheme,
                      onTap: () async {
                        viewModel.edit(request.data);
                      },
                      icon: const Icon(FontAwesomeIcons.penToSquare),
                      title: "Edit"),
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
              ],
            ),
            vSpaceSmall,
            Row(
              children: [
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
  }

  @override
  CardManagerSheetModel viewModelBuilder(BuildContext context) =>
      CardManagerSheetModel();

  @override
  void onViewModelReady(CardManagerSheetModel viewModel) {
    viewModel.card = request.data;

    super.onViewModelReady(viewModel);
  }
}
