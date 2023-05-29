import 'package:auto_route/annotations.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ui/_core/empty_display.dart';
import '../card_open/card_open_view.dart';
import 'card_loader_viewmodel.dart';

@RoutePage()
class CardLoaderView extends StatelessWidget {
  final String? uuid;
  const CardLoaderView({
    Key? key,
    @PathParam('id') this.uuid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardLoaderViewModel>.reactive(
        viewModelBuilder: () => locator<CardLoaderViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (model) {
          if (uuid != null) model.init(uuid ?? "");
        },
        builder: (context, viewModel, child) {
          return Container(
              child: viewModel.busy(loadingCardBusyKey)
                  ? Scaffold(
                      appBar: AppBar(),
                      body: const Center(
                        child: CircularProgressIndicator(),
                      ))
                  : viewModel.card != null
                      ? CardOpenView(
                          card: viewModel.card ?? DigitalCard(),
                          actionType: ActionType.test)
                      : Scaffold(
                          appBar: AppBar(),
                          body: const EmptyDisplay(
                              icon: Icons.warning_amber_rounded,
                              title: "Card not found")));
        });
  }
}
