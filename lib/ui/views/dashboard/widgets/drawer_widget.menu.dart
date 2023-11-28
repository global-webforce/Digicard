import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final Widget leading;
  final bool selected;
  final String title;
  final Function()? onTap;
  const DrawerMenu(
      {super.key,
      required this.title,
      required this.onTap,
      this.selected = false,
      required this.leading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        leading: leading,
        tileColor: selected ? Colors.orange.withOpacity(0.2) : null,
        splashColor: Colors.transparent,
        onTap: () {
          if (onTap != null) {
            /*   Navigator.pop(context);
            Future.delayed(const Duration(milliseconds: 200)); */
            onTap!();
          }
        },
        title: Text(title,
            style: TextStyle(
                fontSize: 16, color: selected ? Colors.white : Colors.white)),
      ),
    );
  }
}
