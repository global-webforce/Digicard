import 'package:digicard/app/models/digital_card.model.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/ui/bottom_sheets/card_tools_bottom_sheet_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddDigitalCardPage extends StatelessWidget {
  final DigitalCard card;
  const AddDigitalCardPage(
    this.card, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardToolsBottomSheetViewModel>.reactive(
        viewModelBuilder: () => CardToolsBottomSheetViewModel(),
        onViewModelReady: (viewModel) async {},
        builder: (context, viewModel, child) {
          return WillPopScope(
            onWillPop: () async {
              return await viewModel.delete(card.id).then((value) {
                return value!.confirmed;
              });
            },
            child: Scaffold(
                appBar: AppBar(
                  title: const Text("Edit Card"),
                  actions: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Save",
                          style: TextStyle(fontSize: 16),
                        ))
                  ],
                ),
                body: ScaffoldBodyWrapper(builder: (context, constraints) {
                  return Text("$card");
                })),
          );
        });
  }
}
