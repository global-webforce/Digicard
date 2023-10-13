import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/constants/dimensions.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/views/card_editor/card_editor_viewmodel.dart';
import 'package:digicard/app/views/card_editor/widgets/card.custom_links.fields.dart';
import 'package:digicard/app/views/card_editor/widgets/card.custom_links.options.dart';
import 'package:digicard/app/views/card_editor/widgets/card.reactive_layout_picker.dart';
import 'package:digicard/app/views/card_editor/widgets/collapsible_field.dart';
import 'package:digicard/app/views/card_editor/widgets/card.reactive_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:stacked/stacked.dart';
import 'card.reactive_avatar_picker.dart';
import 'card.reactive_logo_picker.dart';

class CardTabForm extends StatefulWidget {
  const CardTabForm({Key? key}) : super(key: key);

  @override
  State<CardTabForm> createState() => _CardTabFormState();
}

class _CardTabFormState extends State<CardTabForm>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = [
    const Tab(
      text: 'Info',
    ),
    const Tab(text: 'Designs'),
    const Tab(text: 'Links'),
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
    ReactiveDigitalCardTabForm.of(context);
    final viewModel =
        getParentViewModel<CardEditorViewModel>(context, listen: true);
    final formModel = viewModel.formModel;

    final colorTheme =
        Color(formModel.colorControl?.value ?? kcPrimaryColorInt);

    const inputStyle = InputDecoration(
        contentPadding: EdgeInsets.all(12),
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),

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
      return ReactiveColorPicker(
        colors: cardColors,
        formControl: formModel.colorControl,
      );
    }

    Widget layoutPickerField() {
      return ReactiveLayoutPicker(
        color: colorTheme,
        formControl: formModel.layoutControl,
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
        leading: const BackButton(),
        title: Text(viewModel.actionType == ActionType.edit
            ? "Edit Card"
            : viewModel.actionType == ActionType.duplicate
                ? "Copy Card "
                : "Create Card"),
        actions: [
          ReactiveDigitalCardTabFormConsumer(builder: (context, f, w) {
            return ((viewModel.editMode) &&
                    viewModel.formModel.form.pristine != true)
                ? TextButton(
                    onPressed: () async {
                      await viewModel.save();
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ))
                : const SizedBox.shrink();
          }),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
          labelColor: Colors.white,
          indicatorColor: colorTheme,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: colorTheme),
        ),
      ),
      body: LayoutBuilder(builder: (context, size) {
        return TabBarView(
          controller: _tabController,
          children: [
            ScaffoldBodyWrapper(
                isFullWidth: true,
                padding: Dimens.computedWidth(
                    screenSize: size,
                    targetWidth: 600.000,
                    vPadding: 15,
                    hPadding: 15),
                builder: (context, size) {
                  return Column(
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
                  );
                }),
            ScaffoldBodyWrapper(
              isFullWidth: true,
              padding: Dimens.computedWidth(
                  screenSize: size,
                  targetWidth: 600.000,
                  vPadding: 15,
                  hPadding: 15),
              builder: (context, size) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Design Layout",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    vSpaceRegular,
                    layoutPickerField(),
                    vSpaceRegular,
                    const Text(
                      "Color",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    vSpaceRegular,
                    colorPickerField(),
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
              isFullWidth: true,
              padding: Dimens.computedWidth(
                  screenSize: size,
                  targetWidth: 600.000,
                  vPadding: 15,
                  hPadding: 15),
              builder: (context, size) {
                return const Column(
                  children: [
                    CustomLinkFields(),
                    CustomLinkOptions(),
                  ],
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
