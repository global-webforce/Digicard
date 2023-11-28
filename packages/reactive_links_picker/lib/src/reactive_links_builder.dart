import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:reactive_links_picker/reactive_links_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'icons_list/icons.dart';

class ReactiveLinksBuilder extends StatelessWidget {
  final Color? color;
  final List<Map<String, dynamic>> links;
  const ReactiveLinksBuilder({super.key, required this.links, this.color});

  @override
  Widget build(BuildContext context) {
    final List<CustomLink> customLinks = (links).mapIndexed((i, element) {
      return icons
          .firstWhere(
            (element) => element.label == links[i]['label'],
            orElse: () => CustomLink.empty,
          )
          .copyWith(
            custom: links[i]['custom'],
            value: links[i]['value'],
          );
    }).toList();

    return links.isEmpty
        ? const SizedBox.shrink()
        : Column(
            children: customLinks.mapIndexed((index, element) {
            final customLink = customLinks[index];

            return InkWell(
              onTap: () async {
                if (await canLaunchUrl(
                    Uri.parse("${customLink.prefixLink}${customLink.value}"))) {
                  await launchUrl(
                      Uri.parse("${customLink.prefixLink}${customLink.value}"));
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 15,
                ),
                child: Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: color ?? Theme.of(context).primaryColor,
                        ),
                        child: customLink.icon),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customLink.custom == null ||
                                    customLink.custom.toString().trim().isEmpty
                                ? "${customLink.label}"
                                : "${customLink.custom}",
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            "${customLink.value}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList());
  }
}
