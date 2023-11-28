import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final Function()? onTap;
  final String leading;
  final String? subtitle;
  final String? trailing;
  final String type;
  const SettingsItem({
    super.key,
    required this.leading,
    this.trailing,
    this.subtitle,
    this.onTap,
  }) : type = "simple";

  const SettingsItem.link(
      {super.key,
      required this.leading,
      this.trailing,
      this.subtitle,
      required this.onTap})
      : type = "link";

  const SettingsItem.header({super.key, required this.leading, r})
      : trailing = null,
        subtitle = null,
        type = "header",
        onTap = null;

  @override
  Widget build(BuildContext context) {
    if (type == "link") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leading),
          Row(
            children: [
              if (trailing != null) Text("$trailing"),
              const Icon(
                Icons.chevron_right_outlined,
              ),
            ],
          ),
        ],
      );
    }

    if (type == "header") {
      return Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(leading.toUpperCase()),
          ],
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: InkWell(
        onTap: (onTap != null) ? () => onTap!() : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(leading),
                    if (subtitle != null)
                      Text(
                        "$subtitle",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              if (trailing != null)
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "$trailing",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.color
                              ?.withOpacity(0.6)),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
