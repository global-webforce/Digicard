import 'dart:typed_data';

import 'package:digicard/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CardLogo extends StatelessWidget {
  final Color color;
  final Uint8List? imagePath;

  final Function()? onTap;

  const CardLogo({
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
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0.5, 1.0),
              ),
            ),
            child: child,
          );
        },
        child: (imagePath is Uint8List)
            ? InkWell(
                onTap: onTap != null ? () => onTap!() : null,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: MemoryImage(imagePath!),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ))
            : InkWell(
                onTap: onTap != null ? () => onTap!() : null,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
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
              ));
  }
}

class ReactiveLogoPicker extends ReactiveFormField<Uint8List, Uint8List> {
  ReactiveLogoPicker({
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
            return CardLogo(
              imagePath: field.value,
              color: backgroundColor ?? kcPrimaryColor,
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
  ReactiveFormFieldState<Uint8List, Uint8List> createState() =>
      ReactiveFormFieldState<Uint8List, Uint8List>();
}
