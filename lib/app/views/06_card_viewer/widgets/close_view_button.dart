import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/routes/app_router.dart';
import 'package:digicard/app/views/06_card_viewer/card_display_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CloseViewButton extends StatelessWidget {
  const CloseViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardDisplayViewModel>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 8, 10),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: viewModel.color.withOpacity(0.8)),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => locator<AppRouter>().popUntilRouteWithPath("/"),
          child: const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.close_rounded, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
