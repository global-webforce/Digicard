import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';

class PanelButtons extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  final Function onTap;
  final Color color;
  const PanelButtons(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap,
      this.color = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.zero,
        color: color.withOpacity(0.3),
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            width: 160,
            height: 150,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icon,
                EzText.title1(title, align: TextAlign.center),
                EzText.caption(
                  subtitle,
                  align: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MinButtons extends StatelessWidget {
  final Icon icon;
  final String title;
  final Function onTap;
  final Color color;
  const MinButtons({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.zero,
        color: color.withOpacity(0.3),
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            width: 160,
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 10),
                EzText.caption(title, align: TextAlign.left),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
