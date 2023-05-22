import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:flutter/material.dart';

class IconListItem extends StatelessWidget {
  final Color? color;
  final String? text;
  final IconData? icon;
  final TextStyle? textStyle;
  final bool border;
  const IconListItem(
      {super.key, this.color, this.text, this.icon, this.textStyle})
      : border = false;

  const IconListItem.border({super.key, this.color, this.text, this.textStyle})
      : icon = null,
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
                    backgroundColor:
                        color != null ? color?.darken() : Colors.transparent,
                    child: Icon(
                      icon,
                      color: Colors.white,
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
