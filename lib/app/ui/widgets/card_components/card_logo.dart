import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class CardLogo extends StatefulWidget {
  final Color color;
  final String? image;
  final File? imageError;

  final Function()? onTap;
  const CardLogo({
    Key? key,
    required this.color,
    this.onTap,
    this.image,
    this.imageError,
  }) : super(key: key);

  @override
  State<CardLogo> createState() => _CardLogoState();
}

class _CardLogoState extends State<CardLogo> {
  @override
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 70,
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
                child: CachedNetworkImage(
                  imageUrl: widget.imageError == null ? "${widget.image}" : "",
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: 180,
                      height: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return const SizedBox(
                      width: 180,
                      height: 70,
                    );
                  },
                  errorWidget: (context, url, error) {
                    return widget.imageError == null
                        ? SizedBox(
                            child: InkWell(
                              onTap: widget.onTap != null
                                  ? () {
                                      widget.onTap!();
                                    }
                                  : null,
                              child: Wrap(
                                spacing: 5,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 22,
                                    shadows: <Shadow>[
                                      Shadow(
                                          offset: const Offset(2, 2),
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 10.0)
                                    ],
                                  ),
                                  Text(
                                    "ADD LOGO",
                                    style: TextStyle(
                                      fontSize: 16,
                                      shadows: <Shadow>[
                                        Shadow(
                                            offset: const Offset(2, 2),
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 10.0)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            width: 180,
                            height: 70,
                            decoration: BoxDecoration(
                              image: widget.imageError != null
                                  ? DecorationImage(
                                      fit: BoxFit.contain,
                                      image: FileImage(
                                          widget.imageError ?? File("")))
                                  : null,
                            ),
                          );
                  },
                ),
              ),
            ),
          ),
        ));
  }
}

class RPSCustomPainter extends CustomPainter {
  late BuildContext context;
  final Color color;
  final Function()? onTap;

  RPSCustomPainter(this.context, this.color, this.onTap);

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final w = size.width;

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
    canvas.drawShadow(path0, Colors.black, 1, false);
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
