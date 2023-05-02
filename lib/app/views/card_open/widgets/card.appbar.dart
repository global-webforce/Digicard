import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CardAppBar extends StatelessWidget with PreferredSizeWidget {
  const CardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardOpenViewModel>(context, listen: false);

    final formModel = ReactiveDigitalCardForm.of(context, listen: true);

    final colorTheme =
        Color(formModel?.colorControl?.value ?? kcPrimaryColorInt);

    Widget closeButton() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 8, 10),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: colorTheme.withOpacity(0.8)),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () => Navigator.maybePop(context),
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: Icon(Icons.close_rounded, color: Colors.white),
            ),
          ),
        ),
      );
    }

    return viewModel.editMode
        ? AppBar(
            leading: const BackButton(),
            title: Text(viewModel.actionType == ActionType.edit
                ? "Edit Card"
                : viewModel.actionType == ActionType.duplicate
                    ? "Copy Card "
                    : "Create Card"),
            actions: [
              ReactiveDigitalCardFormConsumer(builder: (context, f, w) {
                return ((viewModel.editMode) &&
                        viewModel.formModel.form.pristine != true)
                    ? TextButton(
                        onPressed: () async {
                          await viewModel.save();
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                        ))
                    : const SizedBox.shrink();
              }),
            ],
          )
        : AppBar(
            leadingWidth: 15,
            toolbarHeight: 60,
            centerTitle: true,
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [closeButton()],
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
