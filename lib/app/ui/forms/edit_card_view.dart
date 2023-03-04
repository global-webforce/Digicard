import 'package:digicard/app/ui/forms/edit_card_view.form.dart';
import 'package:digicard/app/ui/forms/edit_card_viewmodel.dart';
import 'package:digicard/app/ui/forms/form_fields_validators.dart';

import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(
    name: 'fullName',
    validator: FormFieldValidators.name,
  ),
  FormTextField(
    name: 'prefix',
    validator: FormFieldValidators.name,
  ),
  FormTextField(
    name: 'firstName',
    validator: FormFieldValidators.name,
  ),
  FormTextField(
    name: 'middleName',
    validator: FormFieldValidators.name,
  ),
  FormTextField(
    name: 'lastName',
    validator: FormFieldValidators.name,
  ),
  FormTextField(
    name: 'suffix',
    validator: FormFieldValidators.name,
  ),
  FormTextField(
    name: 'accreditations',
    validator: FormFieldValidators.name,
  ),
  FormTextField(
    name: 'preferredName',
    validator: FormFieldValidators.name,
  ),
  FormTextField(
    name: 'maidenName',
    validator: FormFieldValidators.name,
  ),
  FormTextField(
    name: 'pronouns',
    validator: FormFieldValidators.name,
  ),
  FormTextField(
    name: 'title',
    validator: FormFieldValidators.name,
  ),
  FormTextField(
    name: 'department',
    validator: FormFieldValidators.name,
  ),
  FormTextField(
    name: 'company',
    validator: FormFieldValidators.name,
  ),
  FormTextField(
    name: 'headline',
    validator: FormFieldValidators.name,
  ),
])
class CardEditView extends StackedView<CardEditViewModel> with $CardEditView {
  CardEditView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CardEditViewModel viewModel,
    Widget? child,
  ) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          /*          EzButton.elevated(
                      background: viewModel.color,
                      leading: Icons.color_lens_rounded,
                      title: "Pick Color",
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        viewModel.showColorPicker();
                      },
                    ),
                    vSpaceRegular, */
          TextFormField(
            initialValue: viewModel.fulln,
            key: UniqueKey(),
            readOnly: true,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              viewModel.toggleNamePanel();
            },
            decoration: InputDecoration(
              hintText: 'Your Full Name',
              suffixIcon: CircleIconButton(
                icon: viewModel.revealNamePanel
                    ? Icons.arrow_drop_down_rounded
                    : Icons.arrow_drop_up_rounded,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  viewModel.toggleNamePanel();
                },
              ),
            ),
          ),
          if (viewModel.revealNamePanel)
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                children: [
                  vSpaceSmall,
                  TextFormField(
                    controller: prefixController,
                    decoration: InputDecoration(
                      hintText: 'Prefix',
                      suffixIcon: viewModel.hasPrefix
                          ? CircleIconButton(
                              icon: Icons.close,
                              onTap: () {
                                viewModel.prefixValue = null;
                              },
                            )
                          : null,
                    ),
                  ),
                  vSpaceSmall,
                  TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      hintText: 'First name',
                      suffixIcon: viewModel.hasFirstName
                          ? CircleIconButton(
                              icon: Icons.close,
                              onTap: () {
                                viewModel.firstNameValue = null;
                              },
                            )
                          : null,
                    ),
                  ),
                  vSpaceSmall,
                  TextFormField(
                    controller: middleNameController,
                    decoration: InputDecoration(
                      hintText: 'Middle name',
                      suffixIcon: viewModel.hasMiddleName
                          ? CircleIconButton(
                              icon: Icons.close,
                              onTap: () {
                                viewModel.middleNameValue = null;
                              },
                            )
                          : null,
                    ),
                  ),
                  vSpaceSmall,
                  TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      hintText: 'Last name',
                      suffixIcon: viewModel.hasLastName
                          ? CircleIconButton(
                              icon: Icons.close,
                              onTap: () {
                                viewModel.lastNameValue = null;
                              },
                            )
                          : null,
                    ),
                  ),
                  vSpaceSmall,
                  TextFormField(
                    controller: suffixController,
                    decoration: InputDecoration(
                      hintText: 'Suffix',
                      suffixIcon: viewModel.hasSuffix
                          ? CircleIconButton(
                              icon: Icons.close,
                              onTap: () {
                                viewModel.suffixValue = null;
                              },
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          vSpaceSmall,
          TextFormField(
            controller: accreditationsController,
            decoration: InputDecoration(
              hintText: 'Accreditations',
              suffixIcon: viewModel.hasAccreditations
                  ? CircleIconButton(
                      icon: Icons.close,
                      onTap: () {
                        viewModel.accreditationsValue = null;
                      },
                    )
                  : null,
            ),
          ),
          vSpaceSmall,
          TextFormField(
            controller: preferredNameController,
            decoration: InputDecoration(
              hintText: 'Preferred name',
              suffixIcon: viewModel.hasPreferredName
                  ? CircleIconButton(
                      icon: Icons.close,
                      onTap: () {
                        viewModel.preferredNameValue = null;
                      },
                    )
                  : null,
            ),
          ),
          vSpaceSmall,
          TextFormField(
            controller: maidenNameController,
            decoration: InputDecoration(
              hintText: 'Maiden name',
              suffixIcon: viewModel.hasMaidenName
                  ? CircleIconButton(
                      icon: Icons.close,
                      onTap: () {
                        viewModel.maidenNameValue = null;
                      },
                    )
                  : null,
            ),
          ),
          vSpaceSmall,
          TextFormField(
            controller: pronounsController,
            decoration: InputDecoration(
              hintText: 'Pronouns name',
              suffixIcon: viewModel.hasPronouns
                  ? CircleIconButton(
                      icon: Icons.close,
                      onTap: () {
                        viewModel.pronounsValue = null;
                      },
                    )
                  : null,
            ),
          ),
          vSpaceSmall,
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Title',
              suffixIcon: viewModel.hasTitle
                  ? CircleIconButton(
                      icon: Icons.close,
                      onTap: () {
                        viewModel.titleValue = null;
                      },
                    )
                  : null,
            ),
          ),
          vSpaceSmall,
          TextFormField(
            controller: departmentController,
            decoration: InputDecoration(
              hintText: 'Department',
              suffixIcon: viewModel.hasDepartment
                  ? CircleIconButton(
                      icon: Icons.close,
                      onTap: () {
                        viewModel.departmentValue = null;
                      },
                    )
                  : null,
            ),
          ),
          vSpaceSmall,
          TextFormField(
            controller: companyController,
            decoration: InputDecoration(
              hintText: 'Company',
              suffixIcon: viewModel.hasCompany
                  ? CircleIconButton(
                      icon: Icons.close,
                      onTap: () {
                        viewModel.companyValue = null;
                      },
                    )
                  : null,
            ),
          ),
          vSpaceSmall,
          TextFormField(
            controller: headlineController,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            minLines: 4,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Headline',
            ),
          ),
        ],
      ),
    );
  }

  @override
  CardEditViewModel viewModelBuilder(BuildContext context) =>
      CardEditViewModel();

  @override
  void onViewModelReady(CardEditViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(CardEditViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}

class CircleIconButton extends StatelessWidget {
  final double size;
  final Function onTap;
  final IconData icon;

  const CircleIconButton(
      {super.key,
      this.size = 30.0,
      this.icon = Icons.clear,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onTap(),
        child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: const Alignment(0.0, 0.0), // all centered
              children: <Widget>[
                SizedBox(
                  width: size,
                  height: size,
                  /*           decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[300]), */
                ),
                Icon(
                  icon,
                  size: size, // 60% width for icon
                )
              ],
            )));
  }
}
