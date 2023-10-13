import 'package:digicard/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class _ColorPicker extends StatefulWidget {
  final int? value;
  final Function(int color) onChange;
  const _ColorPicker({required this.onChange, this.value});

  @override
  State<_ColorPicker> createState() => __ColorPickerState();
}

class __ColorPickerState extends State<_ColorPicker> {
  final List<int> _colors = cardColors;

  late int _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.value ?? _colors[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _selectedColor = _colors[index];
              widget.onChange(_colors[index]);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 19),
              child: CircleAvatar(
                foregroundColor: Colors.grey,
                backgroundColor: Color(_colors[index]),
                radius: 15,
                child: _selectedColor == _colors[index]
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ReactiveColorPicker extends ReactiveFormField<int, int> {
  ReactiveColorPicker({
    Key? key,
    String? formControlName,
    FormControl<int>? formControl,
    List<int> colors = cardColors,
  }) : super(
          key: key,
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            return _ColorPicker(
                value: field.value,
                onChange: (color) {
                  field.control.value = color;
                  field.control.markAsDirty();
                  field.didChange;
                });
          },
        ) {
    if (this.formControlName == null && this.formControl == null) {
      assert(this.formControlName == null && this.formControl == null,
          'ReactiveColorPicker requires atleast a formControlName or formControl');
    }
  }

  @override
  ReactiveFormFieldState<int, int> createState() =>
      ReactiveFormFieldState<int, int>();
}
