import 'dart:math';

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
      ..strokeWidth = 0.0;

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

class CardWaveDivider extends StatelessWidget {
  final Color color;
  final Widget child;
  final BoxConstraints size;
  const CardWaveDivider(
      {super.key,
      required this.size,
      required this.child,
      required this.color});

  @override
  Widget build(BuildContext context) {
    const waveHeight = 90.0;
    const waveBorderThickness = 8.0;
    const logoPadding = EdgeInsets.fromLTRB(20, 40, 15, 0);
    final logoMaxWidth = min((size.maxWidth) * 0.20, 150.0);
    const logoMaxHeight = 55.0;

    return Stack(
      fit: StackFit.loose,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            size: const Size(double.infinity, waveHeight),
            painter: CardWaves(color),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: waveBorderThickness),
            child: CustomPaint(
              size: const Size(710, waveHeight),
              painter: CardWaves(
                // Colors.red,
                Theme.of(context).cardColor,
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: logoPadding,
              child: Container(
                  width: logoMaxWidth,
                  height: logoMaxHeight,
                  color: Colors.red.withOpacity(0.0),
                  child: child),
            )),
      ],
    );
  }
}
