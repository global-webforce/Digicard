import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/helper/screen_size.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:digicard/app/views/card_open/widgets/card.custom_links.fields.dart';
import 'package:digicard/app/views/card_open/widgets/card.custom_links.options.dart';
import 'package:digicard/app/views/card_open/widgets/collapsible_field.dart';
import 'package:digicard/app/views/card_open/widgets/card.color_picker.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';

import 'card.avatar_picker.dart';
import 'card.layout.dart';
import 'card.logo_picker.dart';

class CardForm extends StatefulWidget {
  const CardForm({Key? key}) : super(key: key);

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = kcPrimaryColor;
  final _unselectedColor = const Color(0xff5f6368);
  final _tabs = [
    const Tab(text: 'General'),
    const Tab(text: 'Display'),
    const Tab(text: 'Fields'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ReactiveDigitalCardForm.of(context);
    final viewModel =
        getParentViewModel<CardOpenViewModel>(context, listen: true);
    final formModel = viewModel.formModel;

    final colorTheme =
        Color(formModel.colorControl?.value ?? kcPrimaryColorInt);

    const inputStyle = InputDecoration(
        // alignLabelWithHint: true,
        contentPadding: EdgeInsets.all(12),
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),

        // filled: false,
        // fillColor: Colors.transparent,
        //  border: UnderlineInputBorder(),
        /*     enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ), */
        floatingLabelBehavior: FloatingLabelBehavior.never);

    Widget avatarField() {
      return ReactiveAvatarPicker(
        formControl: formModel.avatarFileControl,
        readOnly: !viewModel.editMode,
        backgroundColor: colorTheme,
        onTap: !viewModel.editMode
            ? null
            : () async {
                formModel.form.unfocus();
                await viewModel.showAvatarPicker();
              },
      );
    }

    Widget logoField() {
      return ReactiveLogoPicker(
        formControl: formModel.logoFileControl,
        readOnly: !viewModel.editMode,
        backgroundColor: colorTheme,
        onTap: !viewModel.editMode
            ? null
            : () async {
                formModel.form.unfocus();
                await viewModel.showLogoPicker();
              },
      );
    }

    Widget colorPickerField() {
      return Column(
        children: [
          ReactiveColorPicker(
            colors: cardColors,
            formControl: formModel.colorControl,
          ),
        ],
      );
    }

    Widget titleField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          onSubmitted: (control) {
            if (!control.value.isNotNullOrEmpty()) {
              control.value = "New Card";
            }
          },
          showErrors: (control) => false,
          formControl: formModel.titleControl,
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
          formControl: formModel.prefixControl,
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
          formControl: formModel.firstNameControl,
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
          formControl: formModel.middleNameControl,
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
          formControl: formModel.lastNameControl,
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
          formControl: formModel.suffixControl,
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
          formControl: formModel.accreditationsControl,
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
          formControl: formModel.preferredNameControl,
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
          formControl: formModel.maidenNameControl,
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
          formControl: formModel.pronounsControl,
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
          formControl: formModel.positionControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Position")),
        ),
      );
    }

    Widget departmentField() {
      return ReactiveTextField(
        showErrors: (control) => false,
        formControl: formModel.departmentControl,
        textInputAction: TextInputAction.next,
        decoration: inputStyle.copyWith(label: const Text("Department")),
      );
    }

    Widget companyField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel.companyControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Company")),
        ),
      );
    }

    Widget headlineField() {
      return ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel.headlineControl,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: 1,
          decoration: inputStyle.copyWith(label: const Text("Headline")));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Card"),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
          labelColor: _selectedColor,
          indicatorColor: _selectedColor,
          unselectedLabelColor: _unselectedColor,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ScaffoldBodyWrapper(
              isFullWidth: true,
              builder: (context, size) {
                return LayoutBuilder(builder: (context, size) {
                  return Padding(
                    padding: screenWidth(context) > 480.000
                        ? const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0)
                        : EdgeInsets.zero,
                    child: PhysicalModel(
                      color: Colors.transparent,
                      elevation: isDesktop(context) ? 8 : 0,
                      shadowColor: Colors.black,
                      child: Card(
                        margin: EdgeInsetsDirectional.zero,
                        elevation: 0,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Column(
                                  children: [
                                    titleField(),
                                    vSpaceSmall,
                                    CollapsibleField(
                                        onToggle: (expanded) {
                                          viewModel.formModel.form.unfocus();
                                        },
                                        value:
                                            "${formModel.prefixControl?.value ?? ""} ${formModel.firstNameControl?.value ?? ""} ${formModel.middleNameControl?.value ?? ""} ${formModel.lastNameControl?.value ?? ""} ${formModel.suffixControl?.value ?? ""}"
                                                .clean(),
                                        body: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
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
                                        )),
                                    vSpaceSmall,
                                    positionField(),
                                    vSpaceSmall,
                                    departmentField(),
                                    vSpaceSmall,
                                    companyField(),
                                    vSpaceSmall,
                                    headlineField(),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
              }),
          ScaffoldBodyWrapper(
            builder: (context, size) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Design Layout",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  vSpaceRegular,
                  Row(
                    children: [
                      CardLayout(
                          customPaint: Layout1Paint(
                        colorTheme,
                      )),
                      hSpaceRegular,
                      CardLayout(
                          customPaint: Layout2Paint(
                        colorTheme,
                      )),
                    ],
                  ),
                  vSpaceRegular,
                  const Text(
                    "Color",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  vSpaceRegular,
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 15),
                    child: colorPickerField(),
                  ),
                  vSpaceRegular,
                  const Text(
                    "Profile Image",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  vSpaceRegular,
                  avatarField(),
                  vSpaceRegular,
                  const Text(
                    "Logo",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  vSpaceRegular,
                  logoField(),
                ],
              );
            },
          ),
          ScaffoldBodyWrapper(
            builder: (context, size) {
              return Column(
                children: const [
                  CustomLinkFields(),
                  vSpaceRegular,
                  CustomLinkOptions(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
