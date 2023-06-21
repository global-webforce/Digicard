import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../card_display_viewmodel.dart';
import 'close_view_button.dart';

class AppBarDisplay extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<CardDisplayViewModel>(context);
    return AppBar(
      leadingWidth: 15,
      toolbarHeight: 60,
      centerTitle: true,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      actions: [
        if (viewModel.isCardInContacts())
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                viewModel.showOptions();
              },
              icon: Icon(
                Icons.more_horiz,
                size: 40,
                color: viewModel.color,
              ),
            ),
          ),
        if (!kIsWeb || viewModel.action == DisplayType.private)
          const CloseViewButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
