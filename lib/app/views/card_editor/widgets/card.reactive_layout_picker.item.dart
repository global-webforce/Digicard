import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

class LayoutPickerItem extends StatelessWidget {
  final CustomPainter customPaint;
  final bool isSelected;
  final Function() onTap;
  const LayoutPickerItem(
      {super.key,
      required this.customPaint,
      this.isSelected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
            color: isSelected
                ? getThemeManager(context).isDarkMode
                    ? Colors.white
                    : Colors.black
                : Colors.transparent,
            width: 1.5),
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: Ink(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: CustomPaint(
            size: const Size(80,
                40), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: customPaint,
          ),
        ),
      ),
    );
  }
}
