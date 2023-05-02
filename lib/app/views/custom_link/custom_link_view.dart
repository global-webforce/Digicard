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
            body: ScaffoldBodyWrapper(
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
                              label: Text(
                                  "${viewModel.formModel.typeControl?.value} $index"),
                              helperText:
                                  "${CustomLink(type: '${formModel.typeControl?.value}').extras().hintLink}${formModel.textControl?.value ?? ''}",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(
                                  top: 15.0,
                                ),
                                child: Wrap(
                                  children: [
                                    Icon(
                                      CustomLink(
                                              type:
                                                  "${formModel.typeControl?.value}")
                                          .extras()
                                          .icon,
                                      size: 20,
                                    ),
                                    hSpaceRegular,
                                  ],
                                ),
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: 0, minHeight: 0),
                              alignLabelWithHint: true,
                              filled: false,
                              fillColor: Colors.transparent,
                              border: const UnderlineInputBorder(),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              counterText: "",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.auto);

                          Widget textField() {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: ReactiveTextField(
                               
                                  validationMessages: {
                                    'required': (error) => 'Required'
                                  },
                                  textInputAction: textInputAction(
                                      "${formModel.typeControl?.value}"),
                                  maxLines: null,
                                  maxLength:
                                      ("${formModel.typeControl?.value}" ==
                                              "Address")
                                          ? 300
                                          : null,
                                  showErrors: showErrors,
                                  formControl: formModel.textControl,
                                  keyboardType: keyboardType(
                                      "${formModel.typeControl?.value}"),
                                  decoration: inputStyle),
                            );
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
                }),
          );
        });
  }
}
