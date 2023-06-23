import 'package:flutter/material.dart';

class PanelButtons extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  final Function()? onTap;
  final Color? color;
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
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.zero,
        color: color?.withOpacity(0.3),
        child: InkWell(
          onTap: onTap != null ? () => onTap!() : null,
          child: Container(
            width: 160,
            height: 150,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icon,
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(fontSize: 12),
                ),
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
  final Function()? onTap;
  final Color? color;
  final Widget? trailing;
  const MinButtons({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.color = Colors.blue,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.zero,
        color:
            onTap != null ? color?.withOpacity(0.3) : color?.withOpacity(0.2),
        child: InkWell(
          onTap: onTap != null ? () => onTap!() : null,
          child: Container(
            width: 160,
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
      ),
    );
  }
}
