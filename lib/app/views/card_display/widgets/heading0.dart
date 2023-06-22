import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/env/env.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/views/card_display/card_display_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class Heading0 extends StatelessWidget {
  const Heading0({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardDisplayViewModel>(context, listen: false);
    const avatarSize = 160.0;
    Widget logoField() {
      return CachedNetworkImage(
        imageUrl: "${Env.supabaseLogoUrl}${viewModel.card.logoUrl}",
        imageBuilder: (context, imageProvider) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
        placeholder: (context, url) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: SizedBox(height: 56),
          );
        },
        errorWidget: (context, url, error) {
          return const SizedBox.shrink();
        },
      );
    }

    Widget fullNameField() {
      return !viewModel.card.fullName().isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: AutoSizeText(
                viewModel.card.fullName().clean().toTitleCase(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  height: 1.2,
                ),
                maxLines: 2,
                maxFontSize: 30,
                minFontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
            );
    }

    Widget positionField() {
      return !"${viewModel.card.position}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : AutoSizeText(
              viewModel.card.position.clean().toTitleCase(),
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              maxFontSize: 16,
              minFontSize: 12,
            );
    }

    Widget companyField() {
      return !"${viewModel.card.company}".isNotNullOrEmpty()
          ? const SizedBox.shrink()
          : AutoSizeText(
              viewModel.card.company.clean().toTitleCase(),
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              maxLines: 2,
              maxFontSize: 16,
              minFontSize: 12,
            );
    }

    Widget avatarFieldCircle() {
      return CachedNetworkImage(
        imageUrl: "${Env.supabaseAvatarUrl}}${viewModel.card.avatarUrl}",
        imageBuilder: (context, imageProvider) {
          return Container(
            height: avatarSize,
            width: avatarSize,
            decoration: BoxDecoration(
              border: Border.all(color: viewModel.color.darken(0.1), width: 5),
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        placeholder: (context, url) {
          return const SizedBox.shrink();
        },
        errorWidget: (context, url, error) {
          return const SizedBox.shrink();
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: (avatarSize / 2) - 15),
      child: LayoutBuilder(builder: (context, size) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: size.maxWidth,
              constraints: const BoxConstraints(minHeight: 160),
              decoration: BoxDecoration(
                color: viewModel.color.darken(0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  15.0,
                  56,
                  15,
                  (avatarSize / 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    logoField(),
                    fullNameField(),
                    SizedBox(
                      width: size.maxWidth - (avatarSize + 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          positionField(),
                          companyField(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 15,
              bottom: 0 - (avatarSize / 2) + 20,
              child: avatarFieldCircle(),
            ),
          ],
        );
      }),
    );
  }
}
