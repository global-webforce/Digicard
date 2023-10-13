import 'dart:typed_data';

import 'package:digicard/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class _AvatarPicker extends StatelessWidget {
  final Color color;
  final Uint8List? imagePath;
  final Function()? onTap;

  const _AvatarPicker({
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
        child: (imagePath is Uint8List)
            ? InkWell(
                onTap: onTap != null ? () => onTap!() : null,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: MemoryImage(imagePath!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
            : InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: onTap != null ? () => onTap!() : null,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  width: 80,
                  height: 80,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_rounded,
                        size: 20,
                      ),
                    ],
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
            return _AvatarPicker(
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
