import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/dimensions.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/ui/_core/empty_display.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
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

class CardDisplaySplitView extends StatelessWidget {
  final DigitalCard card;
  const CardDisplaySplitView({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardDisplayViewModel>.reactive(
        viewModelBuilder: () => locator<CardDisplayViewModel>(),
        disposeViewModel: false,
        key: UniqueKey(),
        fireOnViewModelReadyOnce: false,
        createNewViewModelOnInsert: true,
        onViewModelReady: (viewModel) async {
          viewModel.card = card;
          viewModel.displayType = DisplayType.private;
        },
        builder: (context, viewModel, child) {
          return const MainWidget();
        });
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<CardDisplayViewModel>(context);

    Widget empty() {
      return const EmptyDisplay(
          icon: Icons.preview_rounded, title: "Card Preview");
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
