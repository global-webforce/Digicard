import 'package:auto_route/auto_route.dart';
import 'package:easy_debounce/easy_debounce.dart';

import 'package:ez_dashboard/src/widgets/ez_appbar.dart';
import 'package:flutter/material.dart';

class EZDrawerMenuItem {
  final String title;
  final IconData icon;
  final int notificationCount;
  final PageRouteInfo route;

  EZDrawerMenuItem({
    required this.title,
    required this.icon,
    required this.route,
    this.notificationCount = 0,
  });
}

//DRAWER HERE!!!
class EZDrawer extends StatefulWidget {
  final Widget? drawerHeader;
  final EZAppBar appBar;

  final List<EZDrawerMenuItem> items;
  final int currentIndex;
  const EZDrawer(
      {Key? key,
      this.drawerHeader,
      required this.items,
      this.currentIndex = 0,
      required this.appBar})
      : super(key: key);

  @override
  State<EZDrawer> createState() => _EZDrawerState();
}

class _EZDrawerState extends State<EZDrawer> {
  List<Widget> items = [];

  @override
  void didChangeDependencies() {
    final autoRouter = AutoRouter.of(context, watch: true);
    items = widget.items.asMap().entries.map((menu) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        color: autoRouter.isRouteActive(menu.value.route.routeName)
            ? Colors.orange.withOpacity(0.3)
            : Colors.transparent,
        child: ListTile(
          leading: Icon(
            menu.value.icon,
            color: autoRouter.isRouteActive(menu.value.route.routeName)
                ? Colors.orange
                : null,
          ),
          title: Text(
            menu.value.title,
            style: TextStyle(
              color: autoRouter.isRouteActive(menu.value.route.routeName)
                  ? Colors.orange
                  : null,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {
            EasyDebounce.debounce(
                'bottom-navigation', const Duration(milliseconds: 100), () {
              context.tabsRouter.setActiveIndex(menu.key);
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
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          widget.appBar,
          widget.drawerHeader ?? const SizedBox.shrink(),
          ListView(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: items)
        ],
      ),
    );
  }
}
