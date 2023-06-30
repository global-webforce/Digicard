import 'package:digicard/app/constants/colors.dart';
import 'package:flutter/material.dart';

class DoneOverlay extends StatelessWidget {
  final Color? color;
  final BuildContext ctx;
  final String title;
  const DoneOverlay(
    this.ctx, {
    super.key,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: color != null
                  ? color?.withOpacity(0.8)
                  : kcPrimaryColor.withOpacity(0.8),
              child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Icon(
                    Icons.check_rounded,
                    size: 40,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
}
