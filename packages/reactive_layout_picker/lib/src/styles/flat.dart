import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class FlatPainter extends CustomPainter {
  final Color? primaryColor;
  final Color? secondaryColor;

  FlatPainter({this.primaryColor, this.secondaryColor});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = secondaryColor ?? Colors.white;
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(0, 0, size.width, size.height),
            bottomRight: Radius.circular(size.width * 0.2222222),
            bottomLeft: Radius.circular(size.width * 0.2222222),
            topLeft: Radius.circular(size.width * 0.2222222),
            topRight: Radius.circular(size.width * 0.2222222)),
        paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(0, -29.25);
    path_1.lineTo(72, -29.25);
    path_1.lineTo(72, 43.262);
    path_1.lineTo(0, 43.262);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = primaryColor ?? Colors.grey;
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(0, 32.184);
    path_2.lineTo(0, 37.064);
    path_2.cubicTo(13.344, 44.235, 24, 44.669, 40.224, 36.234);
    path_2.cubicTo(56.44799999999999, 27.798000000000002, 64.22399999999999,
        28.894000000000002, 72, 30.834000000000003);
    path_2.lineTo(72, 29.57);
    path_2.cubicTo(54.144, 23.58, 39.648, 35.415, 28.415999999999997, 38.368);
    path_2.cubicTo(17.184, 41.319, 9.888, 39.21, 0, 32.184);
    path_2.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
