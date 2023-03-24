import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io' as io;

class CardLogo extends StatefulWidget {
  final Color color;
  final String? image;
  final bool showOnError;

  final Function()? onTap;
  const CardLogo({
    Key? key,
    required this.color,
    this.onTap,
    this.image,
    this.showOnError = true,
  }) : super(key: key);

  @override
  State<CardLogo> createState() => _CardLogoState();
}

class _CardLogoState extends State<CardLogo> {
  @override
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    Widget shape(Widget child) {
      return Center(child: child);
    }

    return CachedNetworkImage(
      imageUrl: "${widget.image}",
      imageBuilder: (context, imageProvider) {
        return InkWell(
          onTap: widget.onTap != null
              ? () {
                  widget.onTap!();
                }
              : null,
          child: shape(Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
          )),
        );
      },
      errorWidget: (context, url, error) {
        if (widget.showOnError == false) {
          return const SizedBox.shrink();
        }

        if (io.File("${widget.image}").existsSync()) {
          return GestureDetector(
            onTap: widget.onTap != null
                ? () {
                    widget.onTap!();
                  }
                : null,
            child: shape(Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: widget.image != null
                    ? DecorationImage(
                        fit: BoxFit.contain,
                        image: FileImage(File("${widget.image}")))
                    : null,
              ),
            )),
          );
        }

        return GestureDetector(
            onTap: widget.onTap != null
                ? () {
                    widget.onTap!();
                  }
                : null,
            child: shape(
              Ink(
                child: Center(
                  child: Wrap(
                    spacing: 5,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        size: 20,
                      ),
                      Text(
                        "ADD LOGO",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
