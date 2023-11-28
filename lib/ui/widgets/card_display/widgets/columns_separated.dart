import 'package:flutter/widgets.dart';

class ColumnSeparated extends StatelessWidget {
  final EdgeInsets padding;
  final double spacing;
  final List<Widget> children;
  const ColumnSeparated(
      {super.key,
      required this.children,
      this.padding = const EdgeInsets.symmetric(vertical: 15),
      this.spacing = 15.0});

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < children.length; i++) {
      if (i % 2 != 0) {
        children.insert(
          i,
          SizedBox(
            height: spacing,
          ),
        );
      }
    }

    return Padding(
      padding: children.isEmpty ? EdgeInsets.zero : padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
