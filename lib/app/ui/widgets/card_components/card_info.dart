import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final TextStyle titleTextStyle;
  final EdgeInsetsGeometry padding;
  final Function()? onTap;

  const InfoItem({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    this.titleTextStyle = const TextStyle(fontSize: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: InkWell(
        onTap: onTap != null
            ? () {
                onTap!();
              }
            : null,
        child: Ink(
          child: Padding(
            padding: padding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: icon),
                const SizedBox(width: 15),
                Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: titleTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
