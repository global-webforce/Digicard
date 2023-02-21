import 'dart:math';

import 'package:flutter/material.dart';

class OnboardItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color pageColor;
  const OnboardItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.imagePath,
      required this.pageColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: pageColor,
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: SizedBox(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: max((constraints.maxWidth - 600) / 2, 15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        imagePath,
                        width: 200,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    subtitle,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
