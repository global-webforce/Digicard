import 'package:digicard/app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomOverlay extends StatelessWidget {
  final String title;
  final Color? color;
  const CustomOverlay({super.key, required this.title, this.color});

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
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Icon(
                    Icons.check_rounded,
                    size: 40,
                    color: Theme.of(ctx).colorScheme.onBackground,
                  )),
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
}
