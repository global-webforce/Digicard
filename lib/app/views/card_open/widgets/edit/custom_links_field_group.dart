import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class CustomLinksFieldGroup extends StatelessWidget {
  const CustomLinksFieldGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveDigitalCardForm.of(context);
    final viewModel =
        getParentViewModel<CardOpenViewModel>(context, listen: true);
    return ReactiveFormArray<Map<String, Object?>>(
      formArray: form?.customLinksControl,
      builder: (context, formArray, child) {
        return Wrap(
            runSpacing: 8,
            spacing: 8,
            children: formArray.value != null
                ? formArray.value!.asMap().entries.map((menu) {
                    final index = menu.key;
                    final customLink = CustomLink(
                      id: int.tryParse(
                          "${formArray.control('$index.id').value}"),
                      text: "${formArray.control('$index.text').value}",
                      cardId: int.tryParse(
                          "${formArray.control('$index.cardId').value}"),
                      label: "${formArray.control('$index.label').value}",
                      type: "${formArray.control('$index.type').value}",
                    );

                    Widget linkField() {
                      return ReactiveTextField<String>(
                        keyboardType: TextInputType.none,
                        onTap: (control) {
                          viewModel.editCustomLink(customLink, index: index);
                          form?.form.markAsDirty(updateParent: true);
                        },
                        readOnly: true,
                        formControlName: '$index.text',
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 14, 15, 0),
                              child: Icon(customLink.icon(), size: 20),
                            ),
                            suffixIcon: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 14, 8, 0),
                                child: InkWell(
                                    onTap: () {
                                      viewModel.removeCustomLink(menu.key);
                                      form?.form
                                          .markAsDirty(updateParent: true);
                                    },
                                    child: const Icon(
                                      Icons.close_rounded,
                                      size: 25,
                                    ))),
                            prefixIconConstraints:
                                const BoxConstraints(minWidth: 0, minHeight: 0),
                            suffixIconConstraints:
                                const BoxConstraints(minWidth: 0, minHeight: 0),
                            alignLabelWithHint: true,
                            filled: false,
                            fillColor: Colors.transparent,
                            border: const UnderlineInputBorder(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            labelText: "${customLink.type}",
                            floatingLabelBehavior: FloatingLabelBehavior.auto),
                      );
                    }

                    return linkField();
                  }).toList()
                : []);
      },
    );
  }
}
