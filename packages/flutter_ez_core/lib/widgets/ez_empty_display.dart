import 'package:flutter/material.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';

class EZEmptyDisplay extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  const EZEmptyDisplay({
    Key? key,
    required this.title,
    this.subtitle = "",
    required this.icon,
  }) : super(key: key);

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
            icon,
            vSpaceRegular,
            Text(
              title,
              textAlign: TextAlign.center,
            ),
            if (subtitle.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
