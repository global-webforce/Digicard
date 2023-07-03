import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:flutter/material.dart';

class IconListItem extends StatelessWidget {
  final Color? iconColor;
  final Color? backgroundColor;
  final String? text;
  final IconData? icon;
  final TextStyle? textStyle;
  final bool border;
  const IconListItem(
      {super.key,
      this.backgroundColor,
      this.text,
      this.icon,
      this.textStyle,
      this.iconColor})
      : border = false;

  const IconListItem.border(
      {super.key, this.backgroundColor, this.text, this.textStyle})
      : icon = null,
        iconColor = null,
        border = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: border
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "$text",
                    style: textStyle,
                  ),
                )
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                    backgroundColor: backgroundColor ?? Colors.transparent,
                    child: Icon(
                      icon,
                      color: iconColor,
                    )),
                hSpaceRegular,
                Expanded(
                  child: Text(
                    "$text",
                    style: textStyle,
                  ),
                )
              ],
            ),
    );
  }
}
