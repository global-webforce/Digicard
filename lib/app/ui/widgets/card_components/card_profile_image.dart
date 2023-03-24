import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
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
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: color,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      /*       placeholder: (context, url) {
        return Container(
          width: double.infinity,
          height: 320,
          decoration: BoxDecoration(color: color.darken()),
        );
      }, */
      errorWidget: (context, url, error) {
        if (showOnError == false) {
          return Container(
            height: 100,
            decoration: BoxDecoration(
              color: color,
            ),
          );
        }

        if (io.File("$image").existsSync()) {
          return InkWell(
            onTap: onTap != null ? () => onTap!() : null,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Ink(
                decoration: BoxDecoration(
                  color: color,
                  image: DecorationImage(
                    image: FileImage(File("$image")),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  // make sure we apply clip it properly
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File("$image")),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        return InkWell(
          onTap: onTap != null ? () => onTap!() : null,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Ink(
                decoration: BoxDecoration(
                  color: color,
                  image: DecorationImage(
                    image: FileImage(File("$image")),
                    fit: BoxFit.cover,
                  ),
                ),
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
                      ),
                      Text(
                        "ADD PROFILE IMAGE",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
