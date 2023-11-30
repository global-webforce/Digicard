import 'package:digicard/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.zero,
      color: kcPrimaryColorDark,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Text(
          "DIGICARD",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
