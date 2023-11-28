import 'package:digicard/ui/views/dashboard/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'bottom_appbar_widget.dart';

class SplitView extends StatelessWidget {
  final int selectedIndex;
  final Widget child;
  const SplitView({
    Key? key,
    required this.child,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 500 + 280) {
      // wide screen: menu on the left, content on the right
      return Row(
        children: [
          SizedBox(
            width: 280,
            child: DrawerWidget(
              selectedIndex: selectedIndex,
            ),
          ),
          //   Container(width: 0.5, color: Colors.black),
          Expanded(child: child),
        ],
      );
    } else {
      // narrow screen: show content, menu inside drawer
      return Scaffold(
        body: child,
        drawer: SizedBox(
          width: 280,
          child: DrawerWidget(
            selectedIndex: selectedIndex,
          ),
        ),
        bottomNavigationBar: BottomAppBarWidget(
          selectedIndex: selectedIndex,
        ),
      );
    }
  }
}
