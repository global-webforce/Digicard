import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';
import 'dart:io' as io;

class CardLogo extends StatefulWidget {
  final Color color;
  final String? image;
  final bool showOnError;

  final Function()? onTap;
  const CardLogo({
    Key? key,
    required this.color,
    this.onTap,
    this.image,
    this.showOnError = true,
  }) : super(key: key);

  @override
  State<CardLogo> createState() => _CardLogoState();
}

class _CardLogoState extends State<CardLogo> {
  @override
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    Widget shape(Widget child) {
      return SizedBox(
        width: double.infinity,
        height: 60,
        child: CanvasTouchDetector(
            gesturesToOverride: const [GestureType.onTapDown],
            builder: (context) => CustomPaint(
                painter: RPSCustomPainter(
                  context,
                  widget.color,
                  (widget.onTap != null) ? widget.onTap! : widget.onTap,
                ),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: child,
                )))),
      );
    }

    return CachedNetworkImage(
      imageUrl: "${widget.image}",
      imageBuilder: (context, imageProvider) {
        return shape(Container(
          width: 180,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        ));
      },
      placeholder: (context, url) {
        return shape(const SizedBox(
          width: 180,
          height: 70,
        ));
      },
      errorWidget: (context, url, error) {
        if (widget.showOnError == false) {
          return const SizedBox.shrink();
        }

        if (io.File("${widget.image}").existsSync()) {
          return shape(Container(
            width: 180,
            height: 70,
            decoration: BoxDecoration(
              image: widget.image != null
                  ? DecorationImage(
                      fit: BoxFit.contain,
                      image: FileImage(File("${widget.image}")))
                  : null,
            ),
          ));
        }

        return InkWell(
            onTap: widget.onTap != null
                ? () {
                    widget.onTap!();
                  }
                : null,
            child: shape(
              Wrap(
                spacing: 5,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    size: 20,
                    /*   shadows: <Shadow>[
                      Shadow(
                          offset: const Offset(2, 2),
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10.0)
                    ], */
                  ),
                  Text(
                    "ADD LOGO",
                    style: TextStyle(
                      fontSize: 15,
                      /*  shadows: <Shadow>[
                        Shadow(
                            offset: const Offset(2, 2),
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10.0)
                      ], */
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  late BuildContext context;
  final Color color;
  final Function()? onTap;

  RPSCustomPainter(this.context, this.color, this.onTap);

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);
    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.0668000, 0);
    path0.quadraticBezierTo(size.width * 0.1331333, size.height * -0.0020000,
        size.width * 0.1672333, size.height * 0.5002000);
    path0.quadraticBezierTo(size.width * 0.2013667, size.height * 1.0110000,
        size.width * 0.3335667, size.height);
    path0.lineTo(size.width * 0.6667667, size.height);
    path0.quadraticBezierTo(size.width * 0.8006000, size.height * 0.9993000,
        size.width * 0.8338000, size.height * 0.5023000);
    path0.quadraticBezierTo(size.width * 0.8671000, size.height * 0.0005000,
        size.width * 0.9333333, 0);
    path0.lineTo(0, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
    // canvas.drawShadow(path0, Colors.black, 1, false);
    myCanvas.drawPath(
      path0,
      paint0,
      onTapDown: onTap != null
          ? (c) {
              onTap!();
            }
          : null,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
