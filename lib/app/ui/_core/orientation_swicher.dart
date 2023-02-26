import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:flutter/material.dart';

class OrientationSwitcher extends StatelessWidget {
  final List<Widget> children;

  const OrientationSwitcher({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? Column(children: children)
        : Row(children: children);
  }
}
