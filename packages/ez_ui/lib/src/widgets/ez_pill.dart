import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';

class EzPill extends StatelessWidget {
  final Widget? leading;
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;

  final bool rounded;

  const EzPill(
    this.title, {
    Key? key,
    this.leading,
    this.backgroundColor,
    this.foregroundColor,
  })  : rounded = false,
        super(key: key);

  const EzPill.rounded(
    this.title, {
    Key? key,
    this.leading,
    this.backgroundColor,
    this.foregroundColor,
  })  : rounded = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            leading ?? const SizedBox.shrink(),
            if (leading != null) hSpaceTiny,
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14, color: foregroundColor ?? Colors.white),
              ),
            )
          ],
        ));
  }

/*     Container(
      decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          borderRadius:
              rounded ? BorderRadius.circular(15) : BorderRadius.circular(8)),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              leading ?? const SizedBox.shrink(),
              if (leading != null) hSpaceTiny,
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: foregroundColor),
              )
            ],
          )),
    ); */
}
