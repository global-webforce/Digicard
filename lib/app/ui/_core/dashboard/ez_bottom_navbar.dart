import 'package:digicard/app/helper/screen_size.dart';
import 'package:flutter/material.dart';

class EZBottomNavbar extends StatelessWidget {
  final Color colorTheme;
  final List<EZBottomNavbarItem> items;
  final Function(int index) onTap;
  final int currentIndex;
  const EZBottomNavbar({
    Key? key,
    required this.items,
    required this.onTap,
    required this.currentIndex,
    this.colorTheme = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isDesktop(context)
        ? const SizedBox.shrink()
        : Wrap(
            children: [
              BottomNavigationBar(
                currentIndex: currentIndex,
                items: items
                    .asMap()
                    .entries
                    .map((e) => BottomNavigationBarItem(
                        icon: Icon(e.value.icon), label: e.value.title))
                    .toList(),
                selectedItemColor: colorTheme,
                unselectedItemColor: Theme.of(context).disabledColor,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                onTap: (i) {
                  onTap(i);
                  /*   EasyDebounce.debounce(
                      'bottom-navigate', const Duration(milliseconds: 100), () {
                   
                  }); */
                },
              ),
            ],
          );
  }
}

class EZBottomNavbarItem {
  final String title;
  final IconData icon;

  EZBottomNavbarItem({
    required this.title,
    required this.icon,
  });
}
