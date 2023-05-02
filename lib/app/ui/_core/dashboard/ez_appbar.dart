import 'package:digicard/app/ui/_core/dashboard/ez_appbar_avatar.dart';
import 'package:digicard/app/ui/_core/dashboard/ez_appbar_icon.dart';
import 'package:flutter/material.dart';

class EZAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final Widget appName;
  final List<EZAppBarIcon> iconBadges;
  final EzAppBarAvatar? userAvatar;
  final String? leadingImageAsset;
  EZAppBar(
      {super.key,
      required this.appName,
      List<EZAppBarIcon>? iconBadges,
      this.userAvatar,
      this.leadingImageAsset})
      : iconBadges = iconBadges ?? [];

  @override
  Widget build(BuildContext context) {
    final List<Widget> actionButtons = [
      ...iconBadges,
      const SizedBox(width: 10),
      userAvatar ?? const SizedBox.shrink()
    ];
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(children: [
          if (leadingImageAsset != null)
            Image.asset("$leadingImageAsset", width: 30, color: Colors.white),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: appName)
        ]),
        actions: actionButtons);
  }
}
