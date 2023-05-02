import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/constants/env.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CardProfileImage extends StatelessWidget {
  final Color color;
  final String? imagePath;
  final bool readOnly;
  final Function()? onTap;

  const CardProfileImage({
    Key? key,
    this.imagePath,
    required this.color,
    this.onTap,
    this.readOnly = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = File("$imagePath");

    Widget errorWidget() {
      return readOnly
          ? Container(
              height: 130,
              decoration: BoxDecoration(
                color: color.darken(0.2),
              ),
            )
          : Material(
              color: color.darken(0.2),
              child: InkWell(
                onTap: onTap != null ? () => onTap!() : null,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
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
                ),
              ),
            );
    }

    if ("$imagePath".isNotNullOrEmpty()) {
      if (avatar.existsSync()) {
        return InkWell(
          onTap: onTap != null ? () => onTap!() : null,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Ink(
              decoration: BoxDecoration(
                color: color,
                image: DecorationImage(
                  image: FileImage(File("$imagePath")),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File("$imagePath")),
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
      if ("$avatarUrlPrefix$imagePath".isValidUrl()) {
        return InkWell(
          onTap: onTap != null ? () => onTap!() : null,
          child: CachedNetworkImage(
            imageUrl: "$avatarUrlPrefix$imagePath",
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
                        color: color,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                ),
              );
            },
            placeholder: (context, url) {
              return AspectRatio(
                aspectRatio: 1 / 1,
                child: Ink(
                  decoration: BoxDecoration(
                    color: color.darken(0.2),
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) {
              return errorWidget();
            },
          ),
        );
      }
    }

    return errorWidget();
  }
}

class ReactiveAvatarPicker extends ReactiveFormField<String, String> {
  ReactiveAvatarPicker({
    Key? key,
    bool? readOnly,
    Function()? onTap,
    String? formControlName,
    Color? backgroundColor,
    FormControl<String>? formControl,
  }) : super(
          key: key,
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            return CardProfileImage(
              imagePath: field.value,
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
