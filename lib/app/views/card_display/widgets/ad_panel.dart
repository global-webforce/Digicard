import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/views/card_display/card_display_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class AdPanel extends StatelessWidget {
  const AdPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardDisplayViewModel>(context, listen: false);
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse('https://www.apple.com/app-store/');
        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: viewModel.color.darken(0.2),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: const Text(
          "Create your own digital business card for FREE",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
