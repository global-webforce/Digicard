import 'dart:math';

import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:flutter/material.dart';

class BottomSheetWrapper extends StatelessWidget {
  /// Widgets will be put inside Column []
  final List<Widget> children;

  final bool fullHeight;

  final Color notchColor;

  const BottomSheetWrapper(
      {super.key,
      required this.children,
      this.fullHeight = false,
      this.notchColor = kcPrimaryColor});

  @override
  Widget build(BuildContext context) {
    Widget notch() {
      return Container(
        color: notchColor,
        height: 25,
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            width: 50,
            height: 5,
          ),
        ),
      );
    }

    EdgeInsets padding = EdgeInsets.symmetric(
        vertical: 16,
        horizontal: max((MediaQuery.of(context).size.width - 500) / 2, 15));

    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        child: Container(
          height: fullHeight ? double.infinity : null,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                notch(),
                Center(
                    child: Container(
                  padding: padding,
                  child: Column(
                      mainAxisSize: MainAxisSize.min, children: children),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum PanelButtonType { normal, big }

class PanelButton extends StatelessWidget {
  final Icon icon;
  final String title;
  final String? subtitle;
  final Function()? onTap;
  final Color? color;
  final Widget? trailing;
  final PanelButtonType type;

  ///Button used inside BottomSheet
  const PanelButton(
      {Key? key,
      required this.icon,
      required this.title,
      this.onTap,
      this.color = kcPrimaryColor,
      this.trailing})
      : subtitle = null,
        type = PanelButtonType.normal,
        super(key: key);

  ///Big Button used inside BottomSheet
  const PanelButton.big(
      {Key? key,
      required this.icon,
      required this.title,
      this.subtitle,
      this.onTap,
      this.color = kcPrimaryColor})
      : type = PanelButtonType.big,
        trailing = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == PanelButtonType.big) {
      return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.zero,
        color: onTap != null
            ? color?.withOpacity(0.3)
            : color?.withOpacity(0.3).darken(0.2),
        child: InkWell(
          onTap: onTap != null ? () => onTap!() : null,
          child: Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.all(15),
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 8.0,
              children: [
                icon,
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(fontSize: 12),
                  ),
              ],
            ),
          ),
        ),
      );
    }
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      color: onTap != null ? color?.withOpacity(0.3) : color?.withOpacity(0.2),
      child: InkWell(
        onTap: onTap != null ? () => onTap!() : null,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              trailing ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
