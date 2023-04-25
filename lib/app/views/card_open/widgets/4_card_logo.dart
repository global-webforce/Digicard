import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/constants/env.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CardLogo extends StatelessWidget {
  final Color color;

  /// Can be String (network-based image) orXFile (local upload)
  final String? imagePath;

  /// When set to true the widget will just display a plain colored container
  final bool readOnly;
  final Function()? onTap;

  const CardLogo({
    Key? key,
    this.imagePath,
    required this.color,
    this.onTap,
    this.readOnly = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logo = File("$imagePath");
    Widget errorWidget() {
      return readOnly
          ? const SizedBox.shrink()
          : InkWell(
              onTap: onTap != null ? () => onTap!() : null,
              child: Ink(
                child: Center(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.add,
                        size: 20,
                      ),
                      Text(
                        "LOGO",
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
            );
    }

    if ("$imagePath".isNotNullOrEmpty()) {
      if (logo.existsSync()) {
        return InkWell(
          onTap: onTap != null ? () => onTap!() : null,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File("$imagePath")),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      }

      if ("$logoUrlPrefix$imagePath".isValidUrl()) {
        return InkWell(
          onTap: onTap != null ? () => onTap!() : null,
          child: CachedNetworkImage(
            imageUrl: "$logoUrlPrefix$imagePath",
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
            placeholder: (context, url) {
              return errorWidget();
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

class ReactiveLogoPicker extends ReactiveFormField<String, String> {
  ReactiveLogoPicker({
    Key? key,
    bool? readOnly,
    Function()? onTap,
    Color backgroundColor = kcPrimaryColor,
    String? formControlName,
    FormControl<String>? formControl,
  }) : super(
          key: key,
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            return CardLogo(
              imagePath: field.value,
              color: backgroundColor,
              readOnly: readOnly ?? true,
              onTap: (onTap != null) ? () => onTap() : null,
            );
          },
        ) {
    if (this.formControlName == null && this.formControl == null) {
      assert(this.formControlName == null && this.formControl == null,
          'ReactiveLogoPicker requires atleast a formControlName or formControl');
    }
  }

  @override
  ReactiveFormFieldState<String, String> createState() =>
      ReactiveFormFieldState<String, String>();
}
