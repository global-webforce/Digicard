import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:digicard/app/views/card_open/widgets/card.avatar_picker.dart';
import 'package:digicard/app/views/card_open/widgets/card.custom_links.display.dart';
import 'package:digicard/app/views/card_open/widgets/card.logo_picker.dart';
import 'package:digicard/app/views/card_open/widgets/card.wave_divider.dart';
import 'package:digicard/app/views/card_open/widgets/icon_list_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReactiveDigitalCardForm.of(context);
    final viewModel =
        getParentViewModel<CardOpenViewModel>(context, listen: true);
    final formModel = viewModel.formModel;

    final colorTheme =
        Color(formModel.colorControl?.value ?? kcPrimaryColorInt);

    Widget avatarField() {
      return ReactiveAvatarPicker(
        formControl: formModel.avatarUrlControl,
        readOnly: true,
        onTap: null,
        backgroundColor: colorTheme,
      );
    }

    Widget logoField() {
      return ReactiveLogoPicker(
        formControl: formModel.logoUrlControl,
        readOnly: true,
        backgroundColor: colorTheme,
      );
    }

    Widget fullNameField() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          formModel.model.fullName().clean().toTitleCase(),
          overflow: TextOverflow.visible,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget positionField() {
      return !"${formModel.model.position}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "${formModel.model.position}".clean().toTitleCase(),
                style: const TextStyle(),
              ),
            );
    }

    Widget departmentField() {
      return !"${formModel.model.department}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "${formModel.model.department}".clean().toTitleCase(),
                style: const TextStyle(),
              ),
            );
    }

    Widget companyField() {
      return !"${formModel.model.company}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : IconListItem(
              icon: Icons.domain,
              text: "${formModel.model.company}".clean().toTitleCase(),
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorTheme,
              ),
            );
    }

    Widget headlineField() {
      return !"${formModel.model.headline}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "${formModel.model.headline}".clean().toTitleCase(),
                style: const TextStyle(),
              ),
            );
    }

    Widget pronounsField() {
      return !"${formModel.model.preferredName}".isNotNullOrEmpty() &&
              !"${formModel.model.pronouns}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : IconListItem(
              color: Colors.transparent,
              icon: Icons.chat_rounded,
              text:
                  "Goes By ${formModel.preferredNameControl?.value} ( ${formModel.pronounsControl?.value} )"
                      .clean()
                      .toTitleCase(),
            );
    }

    return LayoutBuilder(builder: (context, size) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: PhysicalModel(
            color: Colors.transparent,
            elevation: 8,
            shadowColor: Colors.black,
            borderRadius: BorderRadius.circular(30),
            child: Card(
              margin: EdgeInsetsDirectional.zero,
              elevation: 0,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // if you need this
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: avatarField(),
                      ),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: CardWaveDivider(context,
                              color: colorTheme,
                              size: size,
                              child: const SizedBox.shrink() //logoField(),
                              )),
                    ],
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 450,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          fullNameField(),
                          positionField(),
                          departmentField(),
                          companyField(),
                          headlineField(),
                          pronounsField(),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: CustomLinkDisplay(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
