import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class WavePainter extends CustomPainter {
  final Color? primaryColor;
  final Color? secondaryColor;

  WavePainter({this.primaryColor, this.secondaryColor});
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, -24);
    path_0.lineTo(72, -24);
    path_0.lineTo(72, 54);
    path_0.lineTo(0, 54);
    path_0.lineTo(0, -24);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = primaryColor ?? Colors.grey;
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(72, 72.5);
    path_1.lineTo(72, 39.18);
    path_1.cubicTo(44.16, 29.9533, 29.568, 63.3176, 0, 41.7337);
    path_1.lineTo(0, 72.5);
    path_1.lineTo(72, 72.5);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = secondaryColor ?? Colors.white;
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
