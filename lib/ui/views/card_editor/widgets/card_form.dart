import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/env/env.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/views/card_editor/card_editor_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/flutter_ez_core.dart';
import 'package:reactive_color_picker/reactive_color_picker.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:reactive_image_picker_universal/reactive_image_picker_universal.dart';
import 'package:reactive_layout_picker/reactive_layout_picker.dart';
import 'package:reactive_links_picker/reactive_links_picker.dart';
import 'package:stacked/stacked.dart';

class CardTabForm extends StatefulWidget {
  const CardTabForm({Key? key}) : super(key: key);

  @override
  State<CardTabForm> createState() => _CardTabFormState();
}

class _CardTabFormState extends State<CardTabForm>
    with AutomaticKeepAliveClientMixin {
  final _tabs = [
    const Tab(text: 'Info'),
    const Tab(text: 'Designs'),
    const Tab(text: 'Links'),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final formModel = ReactiveDigitalCardDTOForm.of(context);
    final viewModel = getParentViewModel<CardEditorViewModel>(
      context,
      listen: true,
    );
    /*  final formModel = viewModel.formModel; */
    final colorTheme = formModel?.colorControl?.value ?? kcPrimaryColor;

    const inputStyle = InputDecoration(
        contentPadding: EdgeInsets.all(12),
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        floatingLabelBehavior: FloatingLabelBehavior.never);

    Widget avatarField() {
      return ReactiveImagePickerUniversal(
        onChanged: (control) {
          if (control.value == null) {
            formModel?.avatarUrlControl?.updateValue("");
          }
        },
        imageUrl:
            "${Env.supabaseAvatarUrl}${formModel?.avatarUrlControl?.value}",
        formControl: formModel?.avatarFileControl,
        readOnly: !viewModel.editMode,
      );
    }

    Widget logoField() {
      return ReactiveImagePickerUniversal(
        onChanged: (control) {
          if (control.value == null) {
            formModel?.logoUrlControl?.updateValue("");
          }
        },
        imageUrl: "${Env.supabaseLogoUrl}${formModel?.logoUrlControl?.value}",
        formControl: formModel?.logoFileControl,
        readOnly: !viewModel.editMode,
      );
    }

    Widget colorPickerField() {
      return ReactiveMaterialColorPicker<Color>(
        formControl: formModel?.colorControl,
      );
    }

    Widget layoutPickerField() {
      return ReactiveLayoutPicker(
        primaryColor: colorTheme,
        selectedColor: colorTheme,
        formControl: formModel?.layoutControl,
      );
    }

    Widget titleField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          onSubmitted: (control) {},
          showErrors: (control) => false,
          formControl: formModel?.titleControl,
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
          formControl: formModel?.prefixControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Prefix")),
        ),
      );
    }

    Widget firstNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => true,
          formControl: formModel?.firstNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(
              errorStyle: const TextStyle(fontSize: 0),
              label: const Text("First name*")),
        ),
      );
    }

    Widget middleNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel?.middleNameControl,
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
          formControl: formModel?.lastNameControl,
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
          formControl: formModel?.suffixControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Suffix")),
        ),
      );
    }

    Widget positionField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel?.positionControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Position")),
        ),
      );
    }

    Widget companyField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel?.companyControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Company")),
        ),
      );
    }

    Widget linksField() {
      return ReactiveLinksPicker(
        backgroundColor: colorTheme,
        formControl: formModel?.customLinksControl,
      );
    }

    Widget headlineField() {
      return ReactiveTextField(
          showErrors: (control) => false,
          formControl: formModel?.headlineControl,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: 1,
          decoration: inputStyle.copyWith(label: const Text("Headline")));
    }

    save() async {
      formModel?.form.unfocus();
      if (formModel?.form.hasErrors == true) {
        viewModel.showFormErrorsDialog("${formModel?.form.errors.values}");
      } else {
        await viewModel
            .save(formModel?.model ?? DigitalCardDTO.blank())
            .then((value) async {
          formModel?.form.markAsPristine(updateParent: true);
          await viewModel.exitEditor();
        });
      }
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: isMobile(context)
            ? null
            : ReactiveDigitalCardDTOFormConsumer(builder: (context, f, w) {
                return (viewModel.editMode && formModel?.form.pristine != true)
                    ? FloatingActionButton.large(
                        heroTag: "save",
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.save), Text("SAVE")],
                        ),
                        onPressed: () async {
                          await save();
                        })
                    : const SizedBox.shrink();
              }),
        appBar: AppBar(
          leading: const BackButton(),
          title: Text(viewModel.actionType == ActionType.edit
              ? "Edit Card"
              : viewModel.actionType == ActionType.duplicate
                  ? "Copy Card "
                  : "Create Card"),
          actions: [
            if (isMobile(context))
              ReactiveDigitalCardDTOFormConsumer(builder: (context, f, w) {
                return TextButton(
                    onPressed: () async => await viewModel.view(f.model),
                    child: Text(
                      "Preview",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ));
              }),
            hSpaceRegular,
            if (isMobile(context))
              ReactiveDigitalCardDTOFormConsumer(builder: (context, f, w) {
                return (viewModel.editMode && formModel?.form.pristine != true)
                    ? TextButton(
                        onPressed: () async {
                          await save();
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
            tabs: _tabs,
            indicatorColor: colorTheme,
            indicatorSize: TabBarIndicatorSize.tab,
            splashBorderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            indicator: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: colorTheme),
          ),
        ),
        body: LayoutBuilder(builder: (context, size) {
          return TabBarView(
            children: [
              ScaffoldBodyWrapper(
                  isFullWidth: true,
                  padding: scaffoldBodyPadding(
                    size: size,
                    hPadding: 15,
                    vPadding: 15,
                  ),
                  builder: (context, size) {
                    return Column(
                      children: [
                        titleField(),
                        vSpaceSmall,
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
                        positionField(),
                        vSpaceSmall,
                        companyField(),
                        vSpaceSmall,
                        headlineField(),
                      ],
                    );
                  }),
              ScaffoldBodyWrapper(
                isFullWidth: true,
                padding: scaffoldBodyPadding(
                  size: size,
                  hPadding: 15,
                  vPadding: 15,
                ),
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
              SingleChildScrollView(child: linksField()),
            ],
          );
        }),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
