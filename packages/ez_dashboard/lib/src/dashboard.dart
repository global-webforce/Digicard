import 'package:ez_dashboard/src/helpers/screen_size.dart';
import 'package:flutter/material.dart';

class EZDashboard extends StatelessWidget {
  final Widget drawer;
  final Widget mainContent;

  const EZDashboard({Key? key, required this.mainContent, required this.drawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isDesktop(context)) drawer,
        if (isDesktop(context))
          VerticalDivider(
            width: 1,
            thickness: 0,
            color: Theme.of(context).dividerColor,
          ),
        Expanded(child: mainContent),
      ],
    );
  }
}
