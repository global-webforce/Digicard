import 'package:flutter/material.dart';

class SettingsList extends StatelessWidget {
  final bool shrinkWrap;
  final List<SettingsSection> sections;

  const SettingsList({Key? key, required this.sections, this.shrinkWrap = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: ListView.separated(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: shrinkWrap,
        itemCount: sections.length,
        separatorBuilder: (context, i) => Divider(
            height: 10, thickness: 1, color: Colors.grey.withOpacity(0.6)),
        itemBuilder: (context, i) {
          return sections[i];
        },
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String? title;
  final List<SettingsTile> tiles;
  const SettingsSection({Key? key, required this.tiles, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          minLeadingWidth: 10,
          title: title != null
              ? Text(
                  '$title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                )
              : null,
        ),
        ListView(
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          children: tiles,
        ),
      ],
    );
  }
}

class SettingsTile extends StatelessWidget {
  final Widget? icon;
  final String title;
  final String? subtitle;
  final bool isSwitchTile;
  final bool value;
  final Function(bool)? onChanged;
  final Function? onTap;

  const SettingsTile(
      {Key? key,
      required this.icon,
      required this.title,
      this.subtitle,
      required this.onTap})
      : isSwitchTile = false,
        value = false,
        onChanged = null,
        super(key: key);

  const SettingsTile.switchTile(
      {Key? key,
      required this.icon,
      required this.title,
      this.subtitle,
      required this.value,
      required this.onChanged})
      : isSwitchTile = true,
        onTap = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSwitchTile
        ? SwitchListTile.adaptive(
            value: value,
            onChanged: onChanged,
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: subtitle != null ? Text('$subtitle') : null,
            secondary: icon,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          )
        : ListTile(
            leading: icon,
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: subtitle != null
                ? Text(
                    '$subtitle',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  )
                : null,
            trailing: const Icon(
              Icons.chevron_right_outlined,
            ),
            onTap: () => onTap!(),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          );
  }
}

class RoundedIcon extends StatelessWidget {
  final Icon icon;

  final Color? background;
  const RoundedIcon(
    this.icon, {
    Key? key,
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(backgroundColor: background, child: icon);
  }
}
