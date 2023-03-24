import 'package:digicard/app/constants/color_pallette.dart';
import 'package:flutter/material.dart';

class HorizontalColorPicker extends StatefulWidget {
  final Color? value;
  final Function(Color color) onChange;
  const HorizontalColorPicker({super.key, required this.onChange, this.value});

  @override
  State<HorizontalColorPicker> createState() => _HorizontalColorPickerState();
}

class _HorizontalColorPickerState extends State<HorizontalColorPicker> {
  final List<Color> _colors = cardColors;

  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.value ?? _colors[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
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
                backgroundColor: _colors[index],
                radius: 12,
                child: _selectedColor.value == _colors[index].value
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

  void _handleColorSelection(Color color) {
    // Do something with the selected color
    print('Selected color: $color');
  }
}
