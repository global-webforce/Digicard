import 'package:flutter/material.dart';

import 'package:ez_dashboard/screen_size_helper.dart';

Widget? ezDrawerButton(context, GlobalKey<ScaffoldState> scaffoldkey) {
  return isDesktop(context)
      ? null
      : IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => scaffoldkey.currentState!.openDrawer(),
        );
}
