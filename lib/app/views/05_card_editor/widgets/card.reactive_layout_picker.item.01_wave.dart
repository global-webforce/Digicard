import 'package:flutter/material.dart';

class LayoutPickerItem01Wave extends CustomPainter {
  final Color color;

  LayoutPickerItem01Wave(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.8333333);
    path0.lineTo(size.width * 0.4966667, size.height * 0.5033333);
    path0.lineTo(size.width, size.height * 0.1633333);
    path0.lineTo(size.width, 0);
    path0.lineTo(0, 0);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
