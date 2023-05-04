import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/constants/env.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../helper/screen_size.dart';

enum ImageType { none, square }

class ImageSizer extends StatelessWidget {
  final ImageType? type;
  final Widget child;
  final double? aspectRatio;
  final double? maxWidth;
  final double? maxHeight;

  const ImageSizer.none({Key? key, required this.child})
      : type = ImageType.none,
        aspectRatio = null,
        maxHeight = null,
        maxWidth = null,
        super(key: key);

  const ImageSizer.square({
    Key? key,
    required this.child,
    this.maxWidth,
    this.maxHeight,
  })  : type = ImageType.square,
        aspectRatio = 1 / 1,
        super(key: key);

  const ImageSizer.custom({
    Key? key,
    required this.child,
    required this.aspectRatio,
    this.maxWidth,
    this.maxHeight,
  })  : type = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ImageType.none:
        return child;
      case ImageType.square:
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight ?? double.infinity,
            maxWidth: maxWidth ?? double.infinity,
            minWidth: double.infinity,
          ),
          child: AspectRatio(
            aspectRatio: aspectRatio ?? 1 / 1,
            child: child,
          ),
        );
      default:
        throw Exception("Unknown image type: $type");
    }
  }
}

class CardProfileImage extends StatelessWidget {
  final Color color;
  final dynamic image;
  final bool readOnly;
  final Function()? onTap;

  const CardProfileImage({
    Key? key,
    this.image,
    required this.color,
    this.onTap,
    this.readOnly = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.darken(0.2),
      child: InkWell(
        onTap: onTap != null ? () => onTap!() : null,
        child: CachedNetworkImage(
            imageUrl: "$avatarUrlPrefix$image".isValidUrl()
                ? "$avatarUrlPrefix$image"
                : "",
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  color: color,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                child: ImageSizer.square(
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            placeholder: (context, url) {
              return readOnly
                  ? ImageSizer.none(
                      child: Container(
                        height: 130,
                        decoration: BoxDecoration(
                          color: color.darken(0.2),
                        ),
                      ),
                    )
                  : ImageSizer.square(
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
                              "PROFILE IMAGE",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
            },
            errorWidget: (context, url, error) {
              return (image is Uint8List)
                  ? ImageSizer.square(
                      maxHeight: min(screenWidth(context) * 0.55, 450),
                      child: Container(
                        decoration: BoxDecoration(
                          color: color,
                          image: DecorationImage(
                            image: MemoryImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: MemoryImage(image),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : readOnly
                      ? ImageSizer.none(
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              color: color.darken(0.2),
                            ),
                          ),
                        )
                      : ImageSizer.square(
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
                                  "PROFILE IMAGE",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
            }),
      ),
    );
  }
}

class ReactiveAvatarPicker extends ReactiveFormField<String, String> {
  ReactiveAvatarPicker({
    Key? key,
    bool? readOnly,
    Function()? onTap,
    String? formControlName,
    Color? backgroundColor,
    Uint8List? localImage,
    FormControl<String>? formControl,
  }) : super(
          key: key,
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            field.didChange(localImage != null ? "" : field.value);
            return CardProfileImage(
              image: localImage ?? field.value,
              color: backgroundColor ?? kcPrimaryColor,
              readOnly: readOnly ?? true,
              onTap: (onTap != null) ? () => onTap() : null,
            );
          },
        ) {
    if (this.formControlName == null && this.formControl == null) {
      assert(this.formControlName == null && this.formControl == null,
          'ReactiveAvatarPicker requires atleast a formControlName or formControl');
    }
  }

  @override
  ReactiveFormFieldState<String, String> createState() =>
      ReactiveFormFieldState<String, String>();
}
