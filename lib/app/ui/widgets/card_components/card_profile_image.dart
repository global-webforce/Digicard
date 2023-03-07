import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';

class CardProfileImage extends StatelessWidget {
  final Color color;
  final String? image;
  final File? imageError;
  final Function()? onTap;

  const CardProfileImage(
      {Key? key, this.image, required this.color, this.onTap, this.imageError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: imageError == null ? "$image" : "",
        imageBuilder: (context, imageProvider) {
          return InkWell(
            onTap: onTap != null
                ? () {
                    onTap!();
                  }
                : null,
            child: Ink(
              decoration: BoxDecoration(
                color: color.darken(0.2),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              height: 320,
            ),
          );
        },
        placeholder: (context, url) {
          return Container(
            width: double.infinity,
            height: 320,
            decoration: BoxDecoration(color: color.darken()),
          );
        },
        errorWidget: (context, url, error) {
          return InkWell(
            onTap: onTap != null
                ? () {
                    onTap!();
                  }
                : null,
            child: Ink(
              decoration: BoxDecoration(
                color: color.darken(0.2),
                image: imageError != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(imageError ?? File("")))
                    : null,
              ),
              width: double.infinity,
              height: 320,
              child: imageError == null
                  ? Center(
                      child: Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.vertical,
                        children: [
                          Icon(
                            Icons.add,
                            size: 22,
                            shadows: <Shadow>[
                              Shadow(
                                  offset: const Offset(2, 2),
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10.0)
                            ],
                          ),
                          Text(
                            "ADD PROFILE IMAGE",
                            style: TextStyle(
                              fontSize: 16,
                              shadows: <Shadow>[
                                Shadow(
                                    offset: const Offset(2, 2),
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10.0)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
