import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final Widget icon;
  final String? prefixtitle;
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
    this.prefixtitle = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return title.isEmpty || title == "null" || title.contains("\"null\"")
        ? const SizedBox()
        : InkWell(
            onTap: onTap != null
                ? () {
                    onTap!();
                  }
                : null,
            child: Ink(
              child: Padding(
                padding: padding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: icon),
                    const SizedBox(width: 15),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "$prefixtitle$title",
                        style: titleTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
