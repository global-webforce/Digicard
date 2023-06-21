import 'package:digicard/app/constants/dimensions.dart';
import 'package:digicard/app/ui/_core/ez_button.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/views/card_display/card_display_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'ad_panel.dart';
import 'own_button.dart';

class BottomSheetCard extends StatelessWidget {
  const BottomSheetCard({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardDisplayViewModel>(context, listen: false);

    return LayoutBuilder(builder: (context, size) {
      final cardWidth = Dimens.computedWidth(
          screenSize: size, targetWidth: 480.000, vPadding: 0, hPadding: 0);
      return Container(
        padding: cardWidth,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (viewModel.action == DisplayType.public &&
                  viewModel.isCardOwnedByUser())
                const OwnButton(),
              vSpaceSmall,
              Row(
                children: [
                  if (!viewModel.isCardOwnedByUser() &&
                      !viewModel.isCardInContacts())
                    Expanded(
                      child: EzButton.elevated(
                        background: viewModel.color,
                        title: "Add to Contacts",
                        onTap: () async {
                          await viewModel.saveToContacts();
                        },
                      ),
                    ),
                  hSpaceSmall,
                  if (kIsWeb && viewModel.action == DisplayType.public)
                    Expanded(
                      child: EzButton.elevated(
                        background: viewModel.color,
                        title: "Download Contact",
                        onTap: () async {
                          await viewModel.downloadVcf();
                        },
                      ),
                    ),
                ],
              ),
              vSpaceSmall,
              if (kIsWeb && viewModel.action == DisplayType.public)
                const AdPanel()
            ],
          ),
        ),
      );
    });
  }
}
