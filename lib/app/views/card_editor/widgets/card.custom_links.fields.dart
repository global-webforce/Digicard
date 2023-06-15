import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/views/card_editor/card_editor_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class CustomLinkFields extends StatelessWidget {
  const CustomLinkFields({super.key});

  @override
  Widget build(BuildContext context) {
    ReactiveDigitalCardForm.of(context);
    final viewModel =
        getParentViewModel<CardEditorViewModel>(context, listen: true);
    final formModel = viewModel.formModel;

    return ReactiveFormArray<Map<String, Object?>>(
      formArray: formModel.customLinksControl,
      builder: (context, formArray, child) {
        return Wrap(
            runSpacing: 10,
            spacing: 10,
            children: formArray.value != null
                ? formArray.value!.asMap().entries.map((menu) {
                    final index = menu.key;
                    final customLink = CustomLink(
                      text: "${formArray.control('$index.text').value}".clean(),
                      label: "${formArray.control('$index.label').value}",
                      type: "${formArray.control('$index.type').value}",
                    );

                    Widget linkField() {
                      return ReactiveTextField<String>(
                        onTap: (control) {
                          viewModel.editCustomLink(customLink, index: index);
                          formModel.form.markAsDirty(updateParent: true);
                        },
                        readOnly: true,
                        key: UniqueKey(),
                        formControlName: '$index.text'.clean(),
                        maxLines: customLink.type == "Address" ? null : 1,
                        style: const TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding: const EdgeInsets.all(12),
                          isDense: true,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                                    viewModel.removeCustomLink(menu.key);
                                    formModel.form
                                        .markAsDirty(updateParent: true);
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
                    }

                    return linkField();
                  }).toList()
                : []);
      },
    );
  }
}
