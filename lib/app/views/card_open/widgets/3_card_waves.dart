import 'package:flutter/material.dart';

class CardWaves extends CustomPainter {
  final Color color;
  Path path0 = Path();

  CardWaves(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 10.0;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.4);

/*     path0.quadraticBezierTo(
      size.width * 0.2,
      size.height,
      size.width * 0.4,
      size.height * 0.4,
    );
    path0.quadraticBezierTo(
      size.width * 0.7,
      size.height * -0.4,
      size.width,
      size.height * 0.3,
    );
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height); */

    path0.moveTo(0, size.height * 0.4545455);
    path0.quadraticBezierTo(size.width * 0.2531250, size.height * 1.2636364,
        size.width * 0.5800000, size.height * 0.5454545);
    path0.quadraticBezierTo(size.width * 0.8256250, size.height * -0.0090909,
        size.width, size.height * 0.2000000);
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
