import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/views/card_display/card_display_viewmodel.dart';
import 'package:digicard/app/views/card_editor/widgets/icon_list_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:url_launcher/url_launcher.dart';

class Body1 extends StatelessWidget {
  const Body1({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardDisplayViewModel>(context, listen: false);

    Widget fullNameField() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          viewModel.card.fullName().clean().toTitleCase(),
          overflow: TextOverflow.visible,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget positionField() {
      return !"${viewModel.card.position}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "${viewModel.card.position}".clean().toTitleCase(),
                style: const TextStyle(),
              ),
            );
    }

    Widget departmentField() {
      return !"${viewModel.card.department}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "${viewModel.card.department}".clean().toTitleCase(),
                style: const TextStyle(),
              ),
            );
    }

    Widget companyField() {
      return !"${viewModel.card.company}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : IconListItem(
              icon: Icons.domain,
              iconColor: getThemeManager(context).isDarkMode
                  ? Colors.white
                  : Colors.black,
              text: "${viewModel.card.company}".clean().toTitleCase(),
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: viewModel.color,
              ),
            );
    }

    Widget headlineField() {
      return !"${viewModel.card.headline}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "${viewModel.card.headline}".clean().toTitleCase(),
                style: const TextStyle(),
              ),
            );
    }

    Widget pronounsField() {
      return !"${viewModel.card.preferredName}".isNotNullOrEmpty() &&
              !"${viewModel.card.pronouns}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : IconListItem(
              icon: Icons.chat_rounded,
              iconColor: getThemeManager(context).isDarkMode
                  ? Colors.white
                  : Colors.black,
              text:
                  "Goes By ${viewModel.card.preferredName} ( ${viewModel.card.pronouns} )"
                      .clean()
                      .toTitleCase(),
            );
    }

    Widget customLinks() {
      return Wrap(
        runSpacing: 5,
        spacing: 5,
        children: viewModel.card.customLinks.map((e) {
          return GestureDetector(
              onTap: (e.extras().uri != null)
                  ? () async {
                      if (await launchUrl(e.extras().uri ?? Uri())) {
                        throw Exception('Could not launch ${e.extras().uri}');
                      }
                    }
                  : null,
              child: IconListItem(
                icon: e.extras().icon,
                iconColor: Colors.white,
                backgroundColor: viewModel.color,
                text: e.text.clean(),
              ));
        }).toList(),
      );
    }

    Widget dateCreated() {
      return !"${viewModel.card.createdAt}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : IconListItem(
              iconColor: getThemeManager(context).isDarkMode
                  ? Colors.white
                  : Colors.black,
              backgroundColor: Colors.transparent,
              icon: FontAwesomeIcons.circleInfo,
              text:
                  "Created ${DateFormat('MMM dd, yyyy hh:mm a').format(viewModel.card.createdAt ?? DateTime.now())}"
                      .clean(),
            );
    }

    Widget dateAdded() {
      return !"${viewModel.card.createdAt}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : IconListItem(
              iconColor: getThemeManager(context).isDarkMode
                  ? Colors.white
                  : Colors.black,
              backgroundColor: Colors.transparent,
              icon: FontAwesomeIcons.handshake,
              text:
                  "Added ${DateFormat('MMM dd, yyyy hh:mm a').format(viewModel.card.addedAt ?? DateTime.now())}"
                      .clean(),
            );
    }

    return Padding(
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
          customLinks(),
          if (viewModel.isCardOwnedByUser()) dateCreated(),
          if (viewModel.isCardInContacts()) dateAdded(),
        ],
      ),
    );
  }
}
