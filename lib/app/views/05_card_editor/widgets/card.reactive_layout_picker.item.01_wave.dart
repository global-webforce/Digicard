import 'package:flutter/material.dart';

class LayoutPickerItem01Wave extends CustomPainter {
  final Color color;
  Path path0 = Path();

  LayoutPickerItem01Wave(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.0;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.4);


    path0.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.50,
      size.height * 0.50,
    );
    path0.quadraticBezierTo(
      size.width * 0.80,
      0,
      size.width,
      size.height * 0.25,
    );
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool hitTest(Offset position) {
    bool hit = path0.contains(position);
    return hit;
  }
}
