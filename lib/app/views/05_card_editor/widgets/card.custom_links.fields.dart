import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/views/05_card_editor/card_editor_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:collection/collection.dart';

class CustomLinkFields extends StatelessWidget {
  const CustomLinkFields({super.key});

  @override
  Widget build(BuildContext context) {
    ReactiveDigitalCardForm.of(context);
    final viewModel =
        getParentViewModel<CardEditorViewModel>(context, listen: true);
    final formModel = viewModel.formModel;

    return Padding(
      padding: EdgeInsets.only(
          bottom: viewModel.formModel.model.customLinks.isEmpty ? 0 : 15),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: viewModel.formModel.model.customLinks
            .mapIndexed((index, customLink) {
          return TextFormField(
            onTap: () {
              viewModel.editCustomLink(customLink, index: index);
              formModel.form.markAsDirty(updateParent: true);
            },
            initialValue: customLink.text,
            decoration: InputDecoration(
              filled: true,
              contentPadding: const EdgeInsets.all(12),
              isDense: true,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Icon(
                  customLink.extras().icon,
                ),
              ),
              suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                  child: InkWell(
                      onTap: () {
                        viewModel.removeCustomLink(index);
                        formModel.form.markAsDirty(updateParent: true);
                      },
                      child: const Icon(
                        Icons.close_rounded,
                        size: 20,
                      ))),
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              alignLabelWithHint: true,
              labelText: "${customLink.type}",
            ),
          );
        }).toList(),
      ),
    );
  }
}
