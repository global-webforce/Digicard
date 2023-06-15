import 'package:flutter/material.dart';

class CardLayout extends StatelessWidget {
  final CustomPainter customPaint;
  const CardLayout({super.key, required this.customPaint});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 80,
        width: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: CustomPaint(
          size: const Size(80,
              40), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: customPaint,
        ),
      ),
    );
  }
}

class Layout1Paint extends CustomPainter {
  final Color color;

  Layout1Paint(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.4966667);
    path0.quadraticBezierTo(size.width * 0.2483333, size.height * 0.6891667,
        size.width * 0.5000000, size.height * 0.5000000);
    path0.quadraticBezierTo(size.width * 0.7683333, size.height * 0.3266667,
        size.width, size.height * 0.5000000);
    path0.lineTo(size.width * 0.9966667, 0);
    path0.lineTo(0, 0);
    path0.lineTo(0, size.height * 0.4966667);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Layout2Paint extends CustomPainter {
  final Color color;

  Layout2Paint(this.color);

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

class Layout3Paint extends CustomPainter {
  final Color color;

  Layout3Paint(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.5000000);
    path0.lineTo(size.width, size.height * 0.5000000);
    path0.lineTo(size.width, 0);
    path0.lineTo(0, 0);
    path0.lineTo(0, size.height * 0.5000000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
