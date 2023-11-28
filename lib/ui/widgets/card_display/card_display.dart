import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/common/theme.dark.dart';
import 'package:digicard/ui/common/theme.light.dart';
import 'package:digicard/ui/widgets/card_display/widgets/classic_card.dart';
import 'package:digicard/ui/widgets/card_display/widgets/columns_separated.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'card_display_model.dart';

class CardDisplay extends StackedView<CardDisplayModel> {
  final DigitalCardDTO card;
  final DisplayMode mode;
  const CardDisplay(this.card, {required this.mode, super.key});

  @override
  void onViewModelReady(CardDisplayModel viewModel) {
    viewModel.card = card;
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    CardDisplayModel viewModel,
    Widget? child,
  ) {
    final colorTheme = card.color ?? kcPrimaryColor;

    return Theme(
      data: isDarkMode()
          ? darkTheme.copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: colorTheme,
                brightness: Brightness.dark,
              ).copyWith(
                brightness: Brightness.dark,
              ),
            )
          : lightTheme.copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: colorTheme,
                brightness: Brightness.light,
              ).copyWith(
                brightness: Brightness.light,
              ),
            ),
      child: Center(
        child: SizedBox(
          width:
              MediaQuery.of(context).size.width < 440 ? double.infinity : 440,
          child: Column(
            children: [
              ClassicCard(mode: mode, card: card),
              ColumnSeparated(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  children: [
                    if (mode == DisplayMode.view && !kIsWeb)
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: FilledButton(
                            style: ButtonStyle(
                                foregroundColor: const MaterialStatePropertyAll(
                                    Colors.white),
                                backgroundColor:
                                    MaterialStatePropertyAll(colorTheme)),
                            onPressed: () async {
                              await viewModel.addToContacts();
                            },
                            child: const Text("Add to Contacts")),
                      ),
                    if (mode == DisplayMode.view)
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: FilledButton(
                            style: ButtonStyle(
                                foregroundColor: const MaterialStatePropertyAll(
                                    Colors.white),
                                backgroundColor:
                                    MaterialStatePropertyAll(colorTheme)),
                            onPressed: () async {
                              await viewModel.downloadVCF();
                            },
                            child: const Text("Download VCF")),
                      ),
                    if (mode == DisplayMode.view)
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: FilledButton(
                            style: ButtonStyle(
                                foregroundColor: const MaterialStatePropertyAll(
                                    Colors.white),
                                backgroundColor:
                                    MaterialStatePropertyAll(colorTheme)),
                            onPressed: () async {
                              await viewModel.downloadQRCode(context);
                            },
                            child: const Text("Download QR")),
                      )
                  ])
            ],
          ),
        ),
      ),
    );
  }

  @override
  CardDisplayModel viewModelBuilder(BuildContext context) => CardDisplayModel();
}
