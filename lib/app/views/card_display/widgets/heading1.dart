import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/constants/env.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/views/card_display/card_display_viewmodel.dart';
import 'package:digicard/app/views/card_editor/widgets/card.wave_divider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Heading1 extends StatelessWidget {
  const Heading1({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardDisplayViewModel>(context, listen: false);
    const avatarSize = 160.0;
    Widget logoField() {
      return CachedNetworkImage(
        imageUrl: "$logoUrlPrefix${viewModel.card.logoUrl}",
        imageBuilder: (context, imageProvider) {
          return AspectRatio(
            aspectRatio: 1 / 1,
            child: ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return const SizedBox.shrink();
        },
      );
    }

    return LayoutBuilder(builder: (context, size) {
      return SizedBox(
        width: size.maxWidth,
        height: size.maxWidth,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CachedNetworkImage(
              imageUrl: "$avatarUrlPrefix${viewModel.card.avatarUrl}",
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    color: viewModel.color.darken(0.1),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.contain),
                  ),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: viewModel.color.darken(0.1),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                );
              },
              placeholder: (context, url) {
                return Container(
                  color: viewModel.color.darken(0.1),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  color: viewModel.color.darken(0.1),
                );
              },
            ),
            Positioned(
              bottom: 0,
              width: size.maxWidth,
              child: CardWaveDivider(
                context,
                color: viewModel.color,
                size: size,
                child: logoField(),
              ),
            )
          ],
        ),
      );
    });
  }
}
