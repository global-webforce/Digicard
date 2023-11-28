import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:digicard/app/constants/stacked_keys.dart';
import 'package:digicard/app/env/env.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/widgets/card_display/card_display_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/extensions/color_extension.dart';
import 'package:flutter_ez_core/extensions/string_extension.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:reactive_links_picker/reactive_links_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import 'columns_separated.dart';

class ClassicCard extends StatelessWidget {
  final DigitalCardDTO card;
  final DisplayMode mode;
  const ClassicCard({super.key, required this.card, required this.mode});

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<CardDisplayModel>(context);
    final colorTheme = card.color ?? kcPrimaryColor;

    Widget squareImage() {
      return Container(
        color: colorTheme.darken(),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              if (card.avatarUrl != null && card.avatarFile != false)
                Container(
                  decoration: BoxDecoration(
                      color: colorTheme.darken(),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(card.avatarHttpUrl),
                      )),
                ),
              if (card.avatarFile != null && card.avatarFile is Uint8List)
                Container(
                  decoration: BoxDecoration(
                      color: colorTheme.darken(),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: MemoryImage(card.avatarFile ?? Uint8List(0)),
                      )),
                ),
            ],
          ),
        ),
      );
    }

    Widget? circleImage(BoxConstraints size) {
      return (card.logoFile == false)
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Stack(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                children: [
                  if (card.logoUrl is String &&
                      card.logoUrl.toString().isNotEmpty)
                    Container(
                      width: size.maxWidth * 0.25,
                      height: size.maxWidth * 0.25,
                      decoration: BoxDecoration(
                        //  border: Border.all(color: colorTheme.darken()),
                        //   color: colorTheme.darken(),
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(card.logoHttpUrl)),
                        //   shape: BoxShape.circle,
                      ),
                    ),
                  if (card.logoFile is Uint8List && card.logoFile != null)
                    Container(
                      width: size.maxWidth * 0.25,
                      height: size.maxWidth * 0.25,
                      decoration: BoxDecoration(
                        //   border: Border.all(color: colorTheme.darken()),
                        //    color: colorTheme.darken(),
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: MemoryImage(
                            card.logoFile ?? Uint8List(0),
                          ),
                        ),
                        //     shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            );
    }

    Widget? fullName() {
      return isNullEmpty(card.fullName())
          ? null
          : AutoSizeText(
              card.fullName(),
              maxFontSize: 26,
              minFontSize: 12,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            );
    }

    Widget? position() {
      return isNullEmpty(card.position)
          ? null
          : AutoSizeText(
              "${card.position}",
              maxFontSize: 18,
              minFontSize: 14,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
              maxLines: 1,
            );
    }

    Widget? company() {
      return isNullEmpty(card.company)
          ? null
          : Padding(
              padding:
                  EdgeInsets.only(top: isNullEmpty(card.position) ? 0.0 : 8.0),
              child: AutoSizeText(
                "${card.company}",
                maxFontSize: 16,
                minFontSize: 12,
                style: const TextStyle(
                  fontSize: 16,
                ),
                maxLines: 1,
              ),
            );
    }

    Widget? headline() {
      return isNullEmpty(card.headline)
          ? null
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                card.headline ?? "",
                textAlign: TextAlign.left,
              ),
            );
    }

    Widget? customLinks() {
      return (card.customLinks ?? []).isEmpty
          ? null
          : ReactiveLinksBuilder(
              color: colorTheme, links: card.customLinks ?? []);
    }

    Widget? qrCodeLogo() {
      return (card.logoFile is bool && card.logoFile == false) ||
              mode == DisplayMode.edit
          ? null
          : Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (card.logoUrl is String &&
                      card.logoUrl.toString().isNotEmpty &&
                      card.logoFile is! Uint8List)
                    Container(
                      padding: const EdgeInsets.all(3.0),
                      color: Colors.white,
                      child: Image.network(
                        card.logoHttpUrl,
                        width: 250 * 0.16,
                        fit: BoxFit.contain,
                      ),
                    ),
                  if (card.logoFile is Uint8List)
                    Container(
                      padding: const EdgeInsets.all(3.0),
                      color: Colors.white,
                      child: Image.memory(
                        card.logoFile ?? Uint8List(0),
                        width: 250 * 0.16,
                        fit: BoxFit.contain,
                      ),
                    )
                ],
              ),
            );
    }

    Widget qrCode() {
      return mode == DisplayMode.edit
          ? const SizedBox.shrink()
          : ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Screenshot(
                key: UniqueKey(),
                controller: viewModel.screenshotControllerDownload,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: QrImageView(
                        data: DigitalCardDTOExtension.convertToContact(card)!
                            .toVCard(withPhoto: false),
                        version: QrVersions.auto,
                        errorCorrectionLevel: QrErrorCorrectLevel.M,
                        size: 250,
                        eyeStyle: const QrEyeStyle(
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.white,
                        gapless: true,
                      ),
                    ),
                    Align(alignment: Alignment.center, child: qrCodeLogo()),
                  ],
                ),
              ),
            );
    }

    Widget ad() {
      return InkWell(
        onTap: () async {
          final Uri url = Uri.parse(Env.siteUrl);
          if (await canLaunchUrl(url)) launchUrl(url);
        },
        child: Container(
          decoration: BoxDecoration(
            color: colorTheme.darken(),
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(12),
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

    return SelectionArea(
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width < 440 ? 0.0 : 24.0)),
        margin: MediaQuery.of(context).size.width < 440
            ? const EdgeInsets.only(bottom: 15)
            : const EdgeInsets.all(15.0),
        child: LayoutBuilder(builder: (context, size) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              squareImage(),
              Container(
                color: colorTheme,
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (fullName() != null) fullName()!,
                        if (position() != null) position()!,
                        if (company() != null) company()!,
                      ],
                    )),
                    if (circleImage(size) != null) circleImage(size)!
                  ],
                ),
              ),
              ColumnSeparated(children: [
                if (headline() != null) headline()!,
                if (customLinks() != null) customLinks()!,
                if (mode == DisplayMode.view) qrCode(),
              ]),
              ad(),
            ],
          );
        }),
      ),
    );
  }
}
