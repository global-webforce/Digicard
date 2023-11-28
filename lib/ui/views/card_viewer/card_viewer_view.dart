import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/ui/widgets/card_display/card_display.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'card_viewer_viewmodel.dart';

class CardViewerView extends StackedView<CardViewerViewModel> {
  final DigitalCardDTO? card;
  final DisplayMode mode;
  const CardViewerView({this.card, required this.mode, Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CardViewerViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: card == null
          ? const Center(
              child: Text("Card not Found"),
            )
          : SingleChildScrollView(
              child: CardDisplay(
                card ?? DigitalCardDTO.blank(),
                mode: mode,
              ),
            ),
    );
  }

  @override
  CardViewerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardViewerViewModel();
}
