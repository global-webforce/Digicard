import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/helper/screen_size.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/ui/_core/sliver_grid_delegate.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CustomLinkOptions extends StatelessWidget {
  const CustomLinkOptions({super.key});

  @override
  Widget build(BuildContext context) {
    ReactiveDigitalCardForm.of(context);
    final viewModel =
        getParentViewModel<CardOpenViewModel>(context, listen: true);
    final formModel = viewModel.formModel;
    final colorTheme =
        Color(formModel.colorControl?.value ?? kcPrimaryColorInt);

    final types = [
      CustomLink(
        type: "Email",
        label: "Email",
      ),
      CustomLink(
        type: "Address",
        label: "Address",
      ),
      CustomLink(
        type: "Phone Number",
        label: "Phone",
      ),
      CustomLink(
        type: "Website",
        label: "Website",
      ),
      CustomLink(type: "More soon!", label: "More soon!"),
    ];

    return Container(
      decoration: BoxDecoration(
          color: colorTheme.darken(), borderRadius: BorderRadius.circular(20)
          /*   borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ), */
          ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 30,
      ),
      child: GridView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: types.length,
        padding: const EdgeInsets.all(0),
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: isMobile(context) ? 3 : 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            height: 54),
        itemBuilder: (context, index) {
          return CustomLinkButton(types[index],
              onTap: types[index].type == "More soon!"
                  ? null
                  : () {
                      viewModel.addCustomLink(types[index]);
                    });
        },
      ),
    );
  }
}

class CustomLinkButton extends StatelessWidget {
  final CustomLink customLink;
  final Function()? onTap;
  const CustomLinkButton(
    this.customLink, {
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap != null ? () => onTap!() : null,
        child: Ink(
          child: Column(
            children: [
              Icon(
                customLink.extras().icon,
                color: Colors.white,
                size: 25,
              ),
              vSpaceSmall,
              Center(
                child: Text(
                  "${customLink.label}",
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
