import 'package:digicard/features/create_card/viewmodels/digital_card_view_model.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:digicard/app/shared/constants/dimensions.dart';
import 'package:digicard/app/shared/ui/empty_display.dart';
import 'package:digicard/app/shared/ui/list_and_grid_view_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ViewDigitalCardsPage extends StatelessWidget {
  const ViewDigitalCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DigitalCardViewModel>.reactive(
        viewModelBuilder: () => DigitalCardViewModel(),
        builder: (context, viewModel, child) {
          final digitalCard = viewModel.digitalCards;

          Widget addButton() {
            return Container(
              padding: const EdgeInsets.all(15),
              child: const SizedBox(
                height: 40,
                child: EzButton.elevated(
                  leading: Icons.add,
                  title: "ADD OFFERED SERVICE",
                  rounded: true,
                ),
              ),
            );
          }

          return Scaffold(
              appBar: AppBar(
                title: const Text("Manage Offered Services"),
              ),
              bottomNavigationBar: addButton(),
              body: ListAndGridViewWrapper(
                isBusy: viewModel.isBusy,
                emptyIndicatorWidget: const EmptyDisplay(
                  icon: Icons.font_download,
                  title: "WHAT SERVICES DO YOU OFFER?",
                  subtitle: "Show the services you can offer to the clients",
                ),
                onRefresh: () async {},
                itemCount: digitalCard.length,
                builder: (context, constraints) {
                  return ListView.separated(
                    padding: Dimens.sliverPadding800(constraints),
                    itemCount: digitalCard.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      return const Text("FFFFF");
                    },
                  );
                },
              ));
        });
  }
}
