import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/ui/widgets/card_components/card_info.dart';
import 'package:digicard/app/views/card_open/widgets/edit/custom_links_group.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final form = ReactiveDigitalCardForm.of(context, listen: true);

    final colorTheme = Color(form?.colorControl?.value ?? kcPrimaryColorInt);

    Future<void> launchLink(String? link) async {
      final Uri url = Uri.parse("$link");
      if (await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return LayoutBuilder(builder: (context, c) {
      return Container(
        width: double.infinity,
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              vSpaceRegular,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if ("${form?.model.fullName()}".isNotNullOrEmpty())
                    Text(
                      "${form?.model.fullName()}",
                      overflow: TextOverflow.visible,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  if ("${form?.model.position}".isNotNullOrEmpty())
                    Text(
                      "${form?.model.position}",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  if ("${form?.model.department}".isNotNullOrEmpty())
                    Text(
                      "${form?.model.department}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                ],
              ),
              vSpaceRegular,
              InfoItem(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  FontAwesomeIcons.solidBuilding,
                  size: 17,
                ),
                title: "${form?.companyControl?.value}".toUpperCase(),
                titleTextStyle: TextStyle(
                    color: colorTheme,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              vSpaceSmall,
              InfoItem(
                padding: EdgeInsets.zero,
                icon: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 2),
                  child: Container(
                    color: colorTheme,
                    width: 3,
                  ),
                ),
                title: "${form?.headlineControl?.value}",
              ),
              vSpaceSmall,
              InfoItem(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  FontAwesomeIcons.message,
                  size: 18,
                ),
                title:
                    "Goes By \"${form?.preferredNameControl?.value}\" (${form?.pronounsControl?.value})",
              ),
              vSpaceRegular,
              form?.model.customLinks != null
                  ? const SizedBox.shrink()
                  : Card(
                      color: colorTheme.withOpacity(0.4),
                      elevation: 0,
                      clipBehavior: Clip.antiAlias,
                      child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shrinkWrap: true,
                          primary: false,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Wrap(
                                spacing: 15,
                                runSpacing: 15,
                                children: form?.customLinksControl.value
                                        ?.asMap()
                                        .entries
                                        .map((menu) {
                                      final customLink = CustomLink.fromJson(
                                          menu.value as Map<String, dynamic>);

                                      return InkWell(
                                        onTap: () async {
                                          launchLink(
                                              "${customLink.url()}${customLink.text}");
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              customLink.icon(),
                                              size: 20,
                                            ),
                                            hSpaceRegular,
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${customLink.text}",
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  "${customLink.label}",
                                                  style: const TextStyle(
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ))
                                          ],
                                        ),
                                      );
                                    }).toList() ??
                                    [],
                              ),
                            ),
                          ]),
                    ),
              const CustomLinksGroup()
            ],
          ),
        ),
      );
    });
  }
}
