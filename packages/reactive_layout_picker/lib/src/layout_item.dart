import 'package:flutter/material.dart';

class LayoutItem extends StatelessWidget {
  final Color? selectedColor;
  final String name;
  final CustomPainter customPaint;
  final bool isSelected;
  final Function() onTap;
  const LayoutItem(
      {super.key,
      required this.customPaint,
      this.isSelected = false,
      required this.onTap,
      required this.name,
      this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.transparent,
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isSelected
              ? (selectedColor ?? Theme.of(context).primaryColor)
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                child: CustomPaint(
                  size: const Size(72, 72),
                  painter: customPaint,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(name),
            ],
          ),
        ),
      ),
    );
  }
}
