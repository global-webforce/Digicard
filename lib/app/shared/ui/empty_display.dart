import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';

class EmptyDisplay extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final String subtitle;
  const EmptyDisplay(
      {Key? key,
      required this.icon,
      required this.title,
      this.subtitle = "",
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 30,
            ),
            vSpaceSmall,
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
