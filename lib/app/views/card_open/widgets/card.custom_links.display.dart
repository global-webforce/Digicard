import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:digicard/app/views/card_open/widgets/icon_list_item.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomLinkDisplay extends StatelessWidget {
  const CustomLinkDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    ReactiveDigitalCardForm.of(context);
    final viewModel =
        getParentViewModel<CardOpenViewModel>(context, listen: true);
    final formModel = viewModel.formModel;

    final colorTheme =
        Color(formModel.colorControl?.value ?? kcPrimaryColorInt);

    return ReactiveFormArray<Map<String, Object?>>(
      formArray: formModel.customLinksControl,
      builder: (context, formArray, child) {
        return Wrap(
            runSpacing: 8,
            spacing: 8,
            children: formArray.value != null
                ? formArray.value!.asMap().entries.map((menu) {
                    final index = menu.key;
                    final customLink = CustomLink(
                      text: "${formArray.control('$index.text').value}",
                      label: "${formArray.control('$index.label').value}",
                      type: "${formArray.control('$index.type').value}",
                    );

                    Widget linkField() {
                      return GestureDetector(
                          onTap: (customLink.extras().uri != null)
                              ? () async {
                                  if (await launchUrl(
                                      customLink.extras().uri ?? Uri())) {
                                    throw Exception(
                                        'Could not launch ${customLink.extras().uri}');
                                  }
                                }
                              : null,
                          child: IconListItem(
                            icon: customLink.extras().icon,
                            color: colorTheme,
                            text: customLink.text.clean(),
                          ));
                    }

                    return linkField();
                  }).toList()
                : []);
      },
    );
  }
}
