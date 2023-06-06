import 'dart:typed_data';
import 'dart:ui';

import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CardAvatar extends StatelessWidget {
  final Color color;
  final Uint8List? imagePath;
  final Function()? onTap;

  const CardAvatar({
    Key? key,
    this.imagePath,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: (imagePath is! Uint8List)
            ? Material(
                color: color.darken(0.2),
                child: InkWell(
                  onTap: onTap != null ? () => onTap!() : null,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 450,
                      minWidth: double.infinity,
                    ),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Center(
                        child: Wrap(
                          spacing: 10,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.vertical,
                          children: const [
                            Icon(Icons.add, size: 20, color: Colors.white),
                            Text(
                              "PROFILE IMAGE",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Material(
                color: color.darken(0.2),
                child: InkWell(
                  onTap: onTap != null ? () => onTap!() : null,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 450,
                      minWidth: double.infinity,
                    ),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: MemoryImage(imagePath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: MemoryImage(imagePath!),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ));
  }
}

class ReactiveAvatarPicker extends ReactiveFormField<Uint8List, Uint8List> {
  ReactiveAvatarPicker({
    Key? key,
    bool? readOnly,
    Function()? onTap,
    String? formControlName,
    Color? backgroundColor,
    FormControl<Uint8List>? formControl,
  }) : super(
          key: key,
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            return CardAvatar(
              imagePath: field.value,
              color: backgroundColor ?? kcPrimaryColor,
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
  ReactiveFormFieldState<Uint8List, Uint8List> createState() =>
      ReactiveFormFieldState<Uint8List, Uint8List>();
}
