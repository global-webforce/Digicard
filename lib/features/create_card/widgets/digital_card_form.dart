import 'package:digicard/features/create_card/viewmodels/digital_card_view_model.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:stacked/stacked.dart';

class DigitalCardForm extends StatelessWidget {
  const DigitalCardForm({
    Key? key,
  }) : super(key: key);

  final textStyle = const TextStyle(fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<DigitalCardViewModel>(context);

    Widget rateField() {
      return FormBuilderTextField(
        name: "rate_per_hour",
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: "Rate per Hour",
          prefixText: "\$ ",
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          FormBuilder(
            autoFocusOnValidationFailure: true,
            skipDisabled: true,
            child: StaggeredGrid.count(
              crossAxisCount: 1,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: [
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: rateField(),
                ),
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: Row(
                    children: [
                      EzButton.elevated(
                        busy: viewModel.isBusy,
                        title: "Save",
                        onTap: () async {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
