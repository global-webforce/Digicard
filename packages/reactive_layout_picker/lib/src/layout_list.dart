import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_layout_picker/src/styles/flat.dart';
import 'package:reactive_layout_picker/src/styles/wave.dart';
import 'layout_item.dart';

class LayoutList extends StatefulWidget {
  final int? value;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? selectedColor;
  final Function(int layout) onChange;
  const LayoutList({
    super.key,
    required this.onChange,
    this.value,
    this.primaryColor,
    this.secondaryColor,
    this.selectedColor,
  });

  @override
  State<LayoutList> createState() => __LayoutPickerState();
}

class __LayoutPickerState extends State<LayoutList> {
  late List<Map<String, dynamic>> _layout;
  late int _selectedLayout;

  @override
  void initState() {
    super.initState();
    _selectedLayout = widget.value ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    _layout = [
      {
        'name': 'Classic',
        'layout': FlatPainter(
          primaryColor: widget.primaryColor,
          secondaryColor: widget.secondaryColor,
        ),
      },
      {
        'name': 'Circle',
        'layout': WavePainter(
          primaryColor: widget.primaryColor,
          secondaryColor: widget.secondaryColor,
        ),
      },
    ];
    return SizedBox(
      width: double.infinity,
      height: 122,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _layout.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: LayoutItem(
                selectedColor: widget.selectedColor,
                name: _layout[index]['name'],
                customPaint: _layout[index]['layout'],
                isSelected: index == _selectedLayout,
                onTap: () {
                  _selectedLayout = index;
                  widget.onChange(_selectedLayout);
                }),
          );
        },
      ),
    );
  }
}

class ReactiveLayoutPicker<T> extends ReactiveFormField<T, int> {
  ReactiveLayoutPicker({
    Key? key,
    String? formControlName,
    FormControl<T>? formControl,
    final Color? primaryColor,
    final Color? secondaryColor,
    final Color? selectedColor,
    ReactiveFormFieldCallback<T>? onChanged,
  }) : super(
          key: key,
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            return LayoutList(
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                selectedColor: selectedColor,
                value: field.value,
                onChange: (value) {
                  field.control.markAsDirty();
                  field.control.updateValueAndValidity();
                  field.didChange(value);
                  onChanged?.call(field.control);
                });
          },
        ) {
    if (this.formControlName == null && this.formControl == null) {
      assert(this.formControlName == null && this.formControl == null,
          'ReactiveLayoutPicker requires atleast a formControlName or formControl');
    }
  }

  @override
  ReactiveFormFieldState<T, int> createState() =>
      ReactiveFormFieldState<T, int>();
}
