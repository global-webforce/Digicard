import 'package:easy_debounce/easy_debounce.dart';

import 'package:ez_dashboard/src/widgets/ez_appbar.dart';
import 'package:flutter/material.dart';

class EZDrawerMenuItem {
  final String title;
  final IconData icon;
  final int notificationCount;

  EZDrawerMenuItem({
    required this.title,
    required this.icon,
    this.notificationCount = 0,
  });
}

//DRAWER HERE!!!
class EZDrawer extends StatelessWidget {
  final Widget? drawerHeader;
  final EZAppBar appBar;
  final List<EZDrawerMenuItem> items;
  final Function(int index) onTap;
  final int currentIndex;
  const EZDrawer(
      {Key? key,
      this.drawerHeader,
      required this.items,
      required this.appBar,
      required this.onTap,
      required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> menus = [];
    menus = items.asMap().entries.map((menu) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        color: menu.key == currentIndex
            ? Colors.orange.withOpacity(0.3)
            : Colors.transparent,
        child: ListTile(
          leading: Icon(
            menu.value.icon,
            color: menu.key == currentIndex ? Colors.orange : null,
          ),
          title: Text(
            menu.value.title,
            style: TextStyle(
              color: menu.key == currentIndex ? Colors.orange : null,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {
            EasyDebounce.debounce(
                'bottom-navigation', const Duration(milliseconds: 100), () {
              onTap(menu.key);
            });
          },
          trailing: (menu.value.notificationCount > 0)
              ? CircleAvatar(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  radius: 15,
                  child: Text(
                    "${menu.value.notificationCount}",
                  ),
                )
              : const SizedBox.shrink(),
        ),
      );
    }).toList();
    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          appBar,
          drawerHeader ?? const SizedBox.shrink(),
          ListView(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: menus)
        ],
      ),
    );
  }
}
