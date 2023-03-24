import 'package:digicard/app/extensions/color.dart';
import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/ui/widgets/card_components/card_info.dart';
import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final form = ReactiveDigitalCardForm.of(context, listen: false);

    final colorTheme = HexColor.fromHex("${form?.colorControl?.value}") ??
        Theme.of(context).colorScheme.primary;

    Future<void> _launchUrl(String? link) async {
      final Uri url = Uri.parse("$link");
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return ReactiveDigitalCardFormConsumer(builder: (context, v, w) {
      return LayoutBuilder(builder: (context, c) {
        return Container(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 0),
                Text(
                  "${form?.fullnameForm.prefixControl?.value ?? ""} ${form?.fullnameForm.firstNameControl?.value ?? ""} ${form?.fullnameForm.middleNameControl?.value ?? ""} ${form?.fullnameForm.lastNameControl?.value ?? ""} ${form?.fullnameForm.suffixControl?.value ?? ""}"
                      .trim(),
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                vSpaceSmall,
                Text(
                  "${form?.positionControl?.value}",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                vSpaceSmall,
                Text(
                  "${form?.departmentControl?.value}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                vSpaceRegular,
                InfoItem(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    FontAwesomeIcons.solidBuilding,
                    size: 17,
                  ),
                  title: "${form?.companyControl?.value}",
                  titleTextStyle: TextStyle(
                      color: colorTheme,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                vSpaceRegular,
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
                vSpaceRegular,
                InfoItem(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    FontAwesomeIcons.message,
                    size: 18,
                  ),
                  title:
                      "Goes By \"${form?.fullnameForm.preferredNameControl?.value}\" (${form?.fullnameForm.pronounsControl?.value})",
                ),
                vSpaceRegular,
                Card(
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
                                      _launchUrl(
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
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "${customLink.label}",
                                              style:
                                                  const TextStyle(fontSize: 14),
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
                )
              ],
            ),
          ),
        );
      });
    });
  }
}
