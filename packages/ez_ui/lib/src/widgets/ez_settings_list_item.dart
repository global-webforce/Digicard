import 'package:flutter/material.dart';

class EzSettingsListItem extends StatelessWidget {
  final Color? foregroundColor;
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool? value;
  final Function? onTap;
  final Function(bool)? onChanged;
  const EzSettingsListItem.redirect({
    Key? key,
    this.onTap,
    this.foregroundColor,
    required this.icon,
    required this.title,
    this.subtitle,
  })  : value = null,
        onChanged = null,
        super(key: key);

  const EzSettingsListItem.toggle({
    Key? key,
    this.foregroundColor,
    required this.icon,
    required this.title,
    this.value = false,
    required this.onChanged,
    this.subtitle,
  })  : onTap = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (value != null) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: SwitchListTile(
            secondary: Icon(
              icon,
              size: 28,
              color: foregroundColor ??
                  Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.color
                      ?.withOpacity(0.7),
            ),
            title: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: foregroundColor ??
                      Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            subtitle: subtitle != null
                ? Text(
                    "$subtitle",
                    style: const TextStyle(fontSize: 13),
                  )
                : null,
            value: value ?? false,
            onChanged: onChanged),
      );
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: () {
          onTap!();
        },
        leading: Icon(
          icon,
          size: 28,
          color: foregroundColor ??
              Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.7),
        ),
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: foregroundColor ??
                  Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        subtitle: subtitle != null
            ? Text(
                "$subtitle",
                style: const TextStyle(fontSize: 12),
              )
            : null,
        trailing: const Icon(
          Icons.chevron_right_outlined,
          size: 30,
        ),
      ),
    );
  }
}
