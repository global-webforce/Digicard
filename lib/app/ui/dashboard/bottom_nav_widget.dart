
import 'package:flutter/material.dart';


class NavigationBarWidget extends StatelessWidget {
  final int? selectedIndex;

  const NavigationBarWidget({super.key, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) async {
     
      },
      selectedIndex: selectedIndex ?? 0,
      destinations: <Widget>[
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/cards.png',
            width: 24,
          ),
          label: 'Cards',
        ),
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/scan.png',
            width: 24,
          ),
          label: 'Scan',
        ),
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/contacts.png',
            width: 24,
          ),
          label: 'Contacts',
        ),
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/settings.png',
            width: 24,
          ),
          label: 'Settings',
        ),
      ],
    );
  }
}
