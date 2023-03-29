import 'package:digicard/app/helper/screen_size.dart';
import 'package:flutter/material.dart';

class EzDrawerMenu extends StatelessWidget {
  final BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldkey;
  final Function()? onTap;
  const EzDrawerMenu(this.context,
      {super.key, required this.scaffoldkey, this.onTap});

  @override
  Widget build(BuildContext context) {
    return isDesktop(context)
        ? const SizedBox.shrink()
        : IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              if (onTap != null) onTap!();
              scaffoldkey.currentState?.openDrawer();
            },
          );
  }
}
