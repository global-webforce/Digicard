import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:flutter/material.dart';

class CustomOverlay extends StatelessWidget {
  final String title;
  const CustomOverlay({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: CircularProgressIndicator(
                color: kcPrimaryColor,
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
  final BuildContext ctx;
  final String title;
  const DoneOverlay(
    this.ctx, {
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: kcPrimaryColor.withOpacity(0.8),
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
