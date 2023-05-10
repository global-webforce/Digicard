import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/constants/env.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/helper/screen_size.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:digicard/app/views/card_open/widgets/card.custom_links.display.dart';
import 'package:digicard/app/views/card_open/widgets/icon_list_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'card.wave_divider.dart';

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
      return CachedNetworkImage(
        imageUrl: "$avatarUrlPrefix${formModel.avatarUrlControl?.value}",
        imageBuilder: (context, imageProvider) {
          return ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 450,
              minWidth: double.infinity,
            ),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: BoxDecoration(
                  color: colorTheme.darken(0.2),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        placeholder: (context, url) {
          return ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 450,
              minWidth: double.infinity,
            ),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: BoxDecoration(color: colorTheme.darken(0.2)),
              ),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: 130,
            decoration: BoxDecoration(color: colorTheme.darken(0.2)),
          );
        },
      );
    }

    Widget logoField() {
      return CachedNetworkImage(
        imageUrl: "$logoUrlPrefix${formModel.logoUrlControl?.value}",
        imageBuilder: (context, imageProvider) {
          return AspectRatio(
            aspectRatio: 1 / 1,
            child: ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return const SizedBox.shrink();
        },
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
        padding:
            isDesktop(context) ? const EdgeInsets.all(15.0) : EdgeInsets.zero,
        child: Center(
          child: Card(
            margin: EdgeInsetsDirectional.zero,
            elevation: 0,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  isDesktop(context) ? 30 : 0), // if you need this
              side: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: isDesktop(context) ? 2 : 0,
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
                        child: CardWaveDivider(
                          context,
                          color: colorTheme,
                          size: size,
                          child: logoField(),
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
      );
    });
  }
}
