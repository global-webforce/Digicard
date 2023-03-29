import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/ui/_core/ez_button.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/views/custom_link/custom_link_view_model.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';

class CLForm extends StatelessWidget {
  const CLForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<CustomLinkViewModel>(context);

    const inputStyle = InputDecoration(
        alignLabelWithHint: true,
        filled: false,
        fillColor: Colors.transparent,
        border: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto);

    Widget textField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          validationMessages: {'required': (error) => 'Required'},
          /*    textInputAction: TextInputAction.newline,
          minLines: 2,
          maxLines: 5, */
          showErrors: (control) => false,
          formControl: viewModel.formModel.textControl,
          decoration: inputStyle.copyWith(
            label: Text("${viewModel.formModel.typeControl?.value}"),
            alignLabelWithHint: false,
            helperText:
                "${CustomLink(type: '${viewModel.formModel.typeControl?.value}').url()}${viewModel.formModel.textControl?.value ?? ''}",
            isDense: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
              ),
              child: Wrap(
                children: [
                  Icon(
                    CustomLink(
                            type: "${viewModel.formModel.typeControl?.value}")
                        .icon(),
                    size: 20,
                  ),
                  hSpaceRegular,
                ],
              ),
            ),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
          ),
        ),
      );
    }

    return ReactiveFormBuilder(
        form: () => viewModel.formModel.form,
        builder: (context, formGroup, _) {
          return ReactiveFormConsumer(builder: (context, formGroup, _) {
            return Column(
              children: [
                textField(),
                vSpaceRegular,
                EzButton.elevated(
                  disabled: viewModel.formModel.textControl?.hasErrors ?? true,
                  title: "SAVE",
                  onTap: () {
                    viewModel.save();
                  },
                )
              ],
            );
          });
        });
  }
}
