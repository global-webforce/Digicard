import 'package:auto_route/annotations.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/dimensions.dart';
import 'package:digicard/app/constants/keys.dart';

import 'package:digicard/app/ui/_core/empty_display.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/ui/overlays/loader_overlay_wrapper.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'card_display_viewmodel.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'layouts/body0.dart';
import 'layouts/body1.dart';
import 'layouts/heading0.dart';
import 'layouts/heading1.dart';
import 'widgets/app_bar_display.dart';
import 'widgets/bottom_sheet_card.dart';
import 'widgets/card_holder.dart';

@RoutePage()
class CardDisplayView extends StatelessWidget {
  final DigitalCard? card;
  final String? uuid;
  final DisplayType? displayType;
  const CardDisplayView({
    Key? key,
    @PathParam('uuid') this.uuid,
    this.card,
    this.displayType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardDisplayViewModel>.reactive(
        viewModelBuilder: () => locator<CardDisplayViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (viewModel) async {
          await viewModel.start(
            cardParam: card,
            displayTypeParam: displayType,
            uuid: uuid,
          );
          /*     WidgetsBinding.instance.addPostFrameCallback((_) async {
            await viewModel.start(
              cardParam: card,
              displayTypeParam: displayType,
              uuid: uuid,
            );
          }); */
        },
        builder: (context, viewModel, child) {
          return LoaderOverlayWrapper(
              color: viewModel.color,
              type: viewModel.busy(saveBusyKey)
                  ? LoadingType.save
                  : viewModel.busy(deleteBusyKey)
                      ? LoadingType.delete
                      : viewModel.busy(doneBusyKey)
                          ? LoadingType.done
                          : null,
              builder: (context) {
                return const MainWidget();
              });
        });
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<CardDisplayViewModel>(context,listen: false);

    Widget empty() {
      return const EmptyDisplay(
          icon: Icons.error_rounded, title: "Card not found");
    }

    return SafeArea(
      top: false,
      child: LayoutBuilder(builder: (context, size) {
        final cardWidth = Dimens.computedWidth(
            screenSize: size, targetWidth: 440.000, vPadding: 0, hPadding: 0);

        return Scaffold(
          appBar: const AppBarDisplay(),
          bottomSheet: const BottomSheetCard(),
          body: ScaffoldBodyWrapper(
              isBusy: viewModel.busy(loadingCardBusyKey),
              isFullWidth: true,
              isEmpty: viewModel.card.id == null,
              emptyIndicatorWidget: empty(),
              padding: cardWidth,
              builder: (context, size) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: CardHolder(
                    children: [
                      if (viewModel.card.layout == 0) const Heading0(),
                      if (viewModel.card.layout == 1) const Heading1(),
                      if (viewModel.card.layout == 0) const Body0(),
                      if (viewModel.card.layout == 1) const Body1(),
                    ],
                  ),
                );
              }),
        );
      }),
    );
  }
}
