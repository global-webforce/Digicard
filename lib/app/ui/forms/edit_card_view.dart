import 'package:cached_network_image/cached_network_image.dart';
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
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: viewModel.color,
                      width: 5,
                    ),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      "httpsX://images.unsplash.com/photo-1667144384540-9b6051169422?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=730&q=80",
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: double.infinity,
                      height: 320,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return Container(
                      width: double.infinity,
                      height: 320,
                      decoration:
                          BoxDecoration(color: viewModel.color.darken(0.2)),
                      child: Stack(
                        children: [
                          const Positioned(
                              top: 0, right: 0, child: Text("UPLOAD")),
                          if (viewModel.image == null)
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [Text("TAP TO UPLOAD IMAGE")],
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return InkWell(
                      onTap: () {
                        print("Upload..");
                      },
                      child: Ink(
                        width: double.infinity,
                        height: 320,
                        decoration: BoxDecoration(
                            image: (viewModel.image != null)
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(viewModel.image!))
                                : null,
                            color: viewModel.color.darken(0.2)),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        borderRadius: BorderRadius.circular(5),
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          viewModel.showImagePicker();
                                        },
                                        child: Ink(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: viewModel.color,
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: Row(
                                            children: const [
                                              Icon(Icons.image_rounded),
                                              hSpaceTiny,
                                              Text("UPDATE"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      vSpaceSmall,
                                      InkWell(
                                        borderRadius: BorderRadius.circular(5),
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          viewModel.showColorPicker();
                                        },
                                        child: Ink(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: viewModel.color,
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: Row(
                                            children: const [
                                              Icon(Icons.color_lens_rounded),
                                              hSpaceTiny,
                                              Text("COLOR  "),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            if (viewModel.image == null)
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.image_rounded,
                                      size: 30,
                                    ),
                                    vSpaceRegular,
                                    Text("TAP TO UPLOAD IMAGE")
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
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
              ),
            ],
          ),
        ));
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
