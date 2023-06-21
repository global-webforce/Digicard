import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import 'card.layout.dart';

class HorizontalLayoutPicker extends StatefulWidget {
  final int? value;
  final Color color;
  final Function(int layout) onChange;
  const HorizontalLayoutPicker(
      {super.key,
      required this.onChange,
      this.value,
      this.color = Colors.grey});

  @override
  State<HorizontalLayoutPicker> createState() => _HorizontalLayoutPickerState();
}

class _HorizontalLayoutPickerState extends State<HorizontalLayoutPicker> {
  late List<CustomPainter> _layout;
  late int _selectedLayout;

  @override
  void initState() {
    super.initState();
    _selectedLayout = widget.value ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    _layout = [
      Layout0Paint(widget.color),
      Layout1Paint(widget.color),
    ];
    return SizedBox(
      height: 70,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _layout.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CardLayout(
                isSelected: index == _selectedLayout,
                customPaint: _layout[index],
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

class ReactiveLayoutPicker extends ReactiveFormField<int, int> {
  ReactiveLayoutPicker({
    Key? key,
    String? formControlName,
    FormControl<int>? formControl,
    Color color = Colors.grey,
  }) : super(
          key: key,
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            return HorizontalLayoutPicker(
                color: color,
                value: field.value,
                onChange: (layout) {
                  field.control.value = layout;
                  field.control.markAsDirty();
                  field.didChange;
                });
          },
        ) {
    if (this.formControlName == null && this.formControl == null) {
      assert(this.formControlName == null && this.formControl == null,
          'ReactiveLayoutPicker requires atleast a formControlName or formControl');
    }
  }

  @override
  ReactiveFormFieldState<int, int> createState() =>
      ReactiveFormFieldState<int, int>();
}