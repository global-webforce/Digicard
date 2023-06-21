import 'package:auto_route/annotations.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/dimensions.dart';

import 'package:digicard/app/ui/_core/empty_display.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/ui/overlays/loader_overlay_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'card_display_viewmodel.dart';
import 'package:digicard/app/models/digital_card.dart';

import 'widgets/app_bar_display.dart';
import 'widgets/body0.dart';
import 'widgets/body1.dart';
import 'widgets/bottom_sheet_card.dart';
import 'widgets/card_holder.dart';
import 'widgets/heading0.dart';
import 'widgets/heading1.dart';

@RoutePage()
class CardDisplayView extends StatelessWidget {
  final DigitalCard? card;
  final String? uuid;
  final DisplayType? action;
  const CardDisplayView({
    Key? key,
    @PathParam('uuid') this.uuid,
    this.card,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardDisplayViewModel>.reactive(
        viewModelBuilder: () => locator<CardDisplayViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (model) async {
          model.card = card ?? DigitalCard();
          model.action = action ?? DisplayType.public;
          if (uuid != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await model.loadCardbyUuid("$uuid");
            });
          }
        },
        builder: (context, viewModel, child) {
          Widget empty() {
            return const EmptyDisplay(
                icon: Icons.error_rounded, title: "Card not found");
          }

          return viewModel.busy(loadingCardBusyKey)
              ? const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : LoaderOverlayWrapper(
                  color: viewModel.color,
                  type: viewModel.busy(saveBusyKey)
                      ? LoadingType.save
                      : viewModel.busy(deleteBusyKey)
                          ? LoadingType.delete
                          : viewModel.busy(doneBusyKey)
                              ? LoadingType.done
                              : null,
                  builder: (context) {
                    return SafeArea(
                      top: false,
                      child: LayoutBuilder(builder: (context, size) {
                        final cardWidth = Dimens.computedWidth(
                            screenSize: size,
                            targetWidth: 480.000,
                            vPadding: 0,
                            hPadding: 0);

                        return Scaffold(
                          appBar: const AppBarDisplay(),
                          bottomSheet: const BottomSheetCard(),
                          body: ScaffoldBodyWrapper(
                              isFullWidth: true,
                              isEmpty: viewModel.card.id == null,
                              emptyIndicatorWidget: empty(),
                              padding: cardWidth,
                              builder: (context, size) {
                                return CardHolder(
                                  children: [
                                    if (viewModel.card.layout == 0)
                                      const Heading0(),
                                    if (viewModel.card.layout == 1)
                                      const Heading1(),
                                    if (viewModel.card.layout == 0)
                                      const Body0(),
                                    if (viewModel.card.layout == 1)
                                      const Body1(),
                                  ],
                                );
                              }),
                        );
                      }),
                    );
                  });
        });
  }
}
