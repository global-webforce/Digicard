import 'dart:math';

import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/ui/_core/ez_button.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/views/custom_link/custom_link_view_model.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';

class CustomLinkView extends StatelessWidget {
  final CustomLink customLink;
  final int? index;
  const CustomLinkView(this.customLink, {Key? key, this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomLinkViewModel>.reactive(
        viewModelBuilder: () => locator<CustomLinkViewModel>(),
        onViewModelReady: (viewModel) {
          viewModel.initialize(customLink, index: index);
        },
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          final formModel = viewModel.formModel;

          return Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
            ),
            body: LayoutBuilder(builder: (context, size) {
              return ScaffoldBodyWrapper(
                  isFullWidth: true,
                  padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: max((size.maxWidth - 440.000) / 2, 0) > 0
                          ? max((size.maxWidth - 440.000) / 2, 0)
                          : 15),
                  neverScroll: true,
                  centered: true,
                  builder: (context, size) {
                    return ReactiveFormBuilder(
                        form: () => formModel.form,
                        builder: (context, formGroup, _) {
                          return ReactiveFormConsumer(
                              builder: (context, formGroup, _) {
                            TextInputType? keyboardType(val) {
                              switch (val) {
                                case "Email":
                                  return TextInputType.emailAddress;
                                case "Phone Number":
                                  return TextInputType.phone;
                                case "Website":
                                  return TextInputType.url;

                                default:
                                  return null;
                              }
                            }

                            TextInputAction? textInputAction(val) {
                              switch (val) {
                                case "Address":
                                  return TextInputAction.next;

                                default:
                                  return TextInputAction.next;
                              }
                            }

                            showErrors(control) => false;
                            final inputStyle = InputDecoration(
                                contentPadding: const EdgeInsets.all(12),
                                isDense: true,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                label: Text(
                                    "${viewModel.formModel.typeControl?.value}"),
                                helperText:
                                    "${CustomLink(type: '${formModel.typeControl?.value}').extras().hintLink}${formModel.textControl?.value ?? ''}",
                                prefixIcon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                  child: Icon(
                                    CustomLink(
                                            type:
                                                "${formModel.typeControl?.value}")
                                        .extras()
                                        .icon,
                                    size: 20,
                                  ),
                                ),
                                prefixIconConstraints: const BoxConstraints(
                                    minWidth: 0, minHeight: 0),
                                alignLabelWithHint: true,
                                counterText: "",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto);

                            Widget textField() {
                              return ReactiveTextField(
                                  validationMessages: {
                                    'required': (error) => 'Required'
                                  },
                                  textInputAction: textInputAction(
                                      "${formModel.typeControl?.value}"),
                                  maxLines:
                                      ("${formModel.typeControl?.value}" ==
                                              "Address")
                                          ? null
                                          : 1,
                                  maxLength:
                                      ("${formModel.typeControl?.value}" ==
                                              "Address")
                                          ? 300
                                          : null,
                                  showErrors: showErrors,
                                  formControl: formModel.textControl,
                                  keyboardType: keyboardType(
                                      "${formModel.typeControl?.value}"),
                                  decoration: inputStyle);
                            }

                            return Column(
                              children: [
                                textField(),
                                vSpaceRegular,
                                EzButton.elevated(
                                  disabled:
                                      formModel.textControl?.hasErrors ?? true,
                                  title: "SAVE",
                                  onTap: () {
                                    viewModel.save();
                                  },
                                )
                              ],
                            );
                          });
                        });
                  });
            }),
          );
        });
  }
}
