import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';
import 'dart:io' as io;

class CardProfileImage extends StatelessWidget {
  final Color color;
  final String? image;
  final bool showOnError;
  final Function()? onTap;

  const CardProfileImage({
    Key? key,
    required this.image,
    required this.color,
    this.onTap,
    this.showOnError = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "$image",
      imageBuilder: (context, imageProvider) {
        return InkWell(
          onTap: onTap != null
              ? () {
                  onTap!();
                }
              : null,
          child: Ink(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              color: color,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
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
        if (showOnError == false) {
          return Container(
            height: 140,
            decoration: BoxDecoration(
              color: color,
            ),
          );
        }

        if (io.File("$image").existsSync()) {
          return InkWell(
            onTap: onTap != null ? () => onTap!() : null,
            child: Container(
              decoration: BoxDecoration(
                  color: color,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: FileImage(File("$image")))),
              width: double.infinity,
              height: 320,
            ),
          );
        }

        return InkWell(
          onTap: onTap != null ? () => onTap!() : null,
          child: Ink(
              width: double.infinity,
              decoration: BoxDecoration(
                color: color,
              ),
              height: 320,
              child: Center(
                child: Wrap(
                  spacing: 10,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  children: const [
                    Icon(
                      Icons.add,
                      size: 20,
                      /*    shadows: <Shadow>[
                        Shadow(
                            offset: const Offset(2, 2),
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10.0)
                      ], */
                    ),
                    Text(
                      "ADD PROFILE IMAGE",
                      style: TextStyle(
                        fontSize: 15,
                        /*    shadows: <Shadow>[
                          Shadow(
                              offset: const Offset(2, 2),
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10.0)
                        ], */
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
