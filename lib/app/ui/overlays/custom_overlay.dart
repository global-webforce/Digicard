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
