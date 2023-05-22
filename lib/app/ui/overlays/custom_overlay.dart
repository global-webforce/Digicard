import 'package:digicard/app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomOverlay extends StatelessWidget {
  final String title;
  final Color? color;
  final BuildContext ctx;
  const CustomOverlay(this.ctx, {super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CircularProgressIndicator(
                color: color ?? kcPrimaryColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
}
