import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomLinksGroup extends StatelessWidget {
  const CustomLinksGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveDigitalCardForm.of(context);

    return ReactiveFormArray<Map<String, Object?>>(
      formArray: form?.customLinksControl,
      builder: (context, formArray, child) {
        return Wrap(
            runSpacing: 8,
            spacing: 8,
            children: formArray.value != null
                ? formArray.value!.asMap().entries.map((menu) {
                    final index = menu.key;
                    final customLink = CustomLink(
                      id: int.tryParse(
                          "${formArray.control('$index.id').value}"),
                      text: "${formArray.control('$index.text').value}",
                      cardId: int.tryParse(
                          "${formArray.control('$index.cardId').value}"),
                      label: "${formArray.control('$index.label').value}",
                      type: "${formArray.control('$index.type').value}",
                    );

                    Widget linkField() {
                      return GestureDetector(
                        onTap: () async {
                          if (!await launchUrl(customLink.uri())) {
                            throw Exception(
                                'Could not launch ${customLink.uri()}');
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            children: [
                              Icon(customLink.icon(), size: 20),
                              hSpaceRegular,
                              Expanded(
                                child: Text(
                                  "${customLink.text}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }

                    return linkField();
                  }).toList()
                : []);
      },
    );
  }
}
