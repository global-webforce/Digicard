import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:digicard/app/views/card_open/widgets/edit/collapsible_field.dart';

import 'package:digicard/app/views/card_open/widgets/edit/custom_links_field_group.dart';
import 'package:digicard/app/views/card_open/widgets/edit/horizontal_color_picker.dart';
import 'package:digicard/app/views/card_open/widgets/preview/custom_links_button_group.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';

class CardForm extends StatelessWidget {
  const CardForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final form = ReactiveDigitalCardForm.of(context);
    final viewModel =
        getParentViewModel<CardOpenViewModel>(context, listen: true);

    const inputStyle = InputDecoration(
        alignLabelWithHint: true,
        filled: false,
        fillColor: Colors.transparent,
        border: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto);

    Widget colorPickerField() {
      return Column(
        children: [
          ReactiveColorPicker(
            colors: cardColors,
            formControl: form?.colorControl,
          ),
        ],
      );
    }

    Widget titleField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          onSubmitted: (control) {},
          showErrors: (control) => false,
          formControl: form?.titleControl,
          textInputAction: TextInputAction.done,
          decoration: inputStyle.copyWith(label: const Text("Title")),
        ),
      );
    }

    Widget prefixField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.prefixControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Prefix")),
        ),
      );
    }

    Widget firstNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.firstNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("First name*")),
        ),
      );
    }

    Widget middleNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.middleNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Middle name")),
        ),
      );
    }

    Widget lastNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.lastNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Last name")),
        ),
      );
    }

    Widget suffixField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.suffixControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Suffix")),
        ),
      );
    }

    Widget accrediationsField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.accreditationsControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Accreditations")),
        ),
      );
    }

    Widget preferredNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.preferredNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Preferred Name")),
        ),
      );
    }

    Widget maidenNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.maidenNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Maiden Name")),
        ),
      );
    }

    Widget pronounsField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.pronounsControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Pronouns")),
        ),
      );
    }

    Widget positionField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.positionControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Position")),
        ),
      );
    }

    Widget departmentField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.departmentControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Department")),
        ),
      );
    }

    Widget companyField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.companyControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Company")),
        ),
      );
    }

    Widget headlineField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
            showErrors: (control) => false,
            formControl: form?.headlineControl,
            textInputAction: TextInputAction.next,
            maxLines: null,
            minLines: 3,
            keyboardType: TextInputType.multiline,
            decoration: inputStyle.copyWith(label: const Text("Headline"))),
      );
    }

    Widget customLinks() {
      return const CustomLinksFieldGroup();
    }

    return Container(
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 15),
                  child: colorPickerField(),
                ),
                titleField(),
                vSpaceSmall,
                ReactiveDigitalCardFormConsumer(builder: (context, _, __) {
                  return CollapsibleField(
                      onToggle: (expanded) {
                        viewModel.formModel.form.unfocus();
                      },
                      value:
                          "${form?.prefixControl?.value ?? ""} ${form?.firstNameControl?.value ?? ""} ${form?.middleNameControl?.value ?? ""} ${form?.lastNameControl?.value ?? ""} ${form?.suffixControl?.value ?? ""}"
                              .trim(),
                      body: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            prefixField(),
                            vSpaceSmall,
                            firstNameField(),
                            vSpaceSmall,
                            middleNameField(),
                            vSpaceSmall,
                            lastNameField(),
                            vSpaceSmall,
                            suffixField(),
                            vSpaceSmall,
                            accrediationsField(),
                            vSpaceSmall,
                            preferredNameField(),
                            vSpaceSmall,
                            maidenNameField(),
                            vSpaceSmall,
                            pronounsField(),
                          ],
                        ),
                      ));
                }),
                vSpaceSmall,
                positionField(),
                vSpaceSmall,
                departmentField(),
                vSpaceSmall,
                companyField(),
                vSpaceSmall,
                headlineField(),
                vSpaceSmall,
                customLinks(),
                vSpaceSmall,
              ],
            ),
          ),
          const CustomLinksButtonGroup(),
        ],
      ),
    );
  }
}
