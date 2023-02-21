import 'package:digicard/app/models/digital_card.model.dart';
import 'package:digicard/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:digicard/features/create_card/viewmodels/digital_card_view_model.dart';
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
    return ViewModelBuilder<DigitalCardViewModel>.reactive(
        viewModelBuilder: () => DigitalCardViewModel(),
        onViewModelReady: (viewModel) async {},
        builder: (context, viewModel, child) {
          return WillPopScope(
            onWillPop: () => viewModel.delete(card.id),
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
