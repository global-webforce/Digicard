import 'package:digicard/app/views/card_display/card_display_viewmodel.dart';
import 'package:digicard/app/views/card_display/widgets/card_items.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Body0 extends StatelessWidget {
  const Body0({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardDisplayViewModel>(context, listen: true);
    final cardItems = CardItems(context, color: viewModel.color);
    return Container(
      constraints: const BoxConstraints(
        minHeight: 300,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            cardItems.headline(viewModel.card.headline),
            cardItems.pronouns(context,
                preferredName: viewModel.card.preferredName,
                pronouns: viewModel.card.pronouns),
            cardItems.customLinks(viewModel.card.customLinks),
            if (viewModel.isCardOwnedByUser())
              cardItems.dateCreated(viewModel.card.createdAt),
            if (viewModel.isCardInContacts())
              cardItems.dateCreated(viewModel.card.addedAt)
          ],
        ),
      ),
    );
  }
}
