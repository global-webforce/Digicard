import 'package:digicard/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'drawer_widget.menu.dart';

class DrawerWidget extends StatefulWidget {
  final int selectedIndex;
  const DrawerWidget({super.key, this.selectedIndex = 0});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<DashboardViewModel>(context);
    int currentIndex = viewModel.currentIndex;
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(children: [
                AppBar(
                  forceMaterialTransparency: true,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  title: const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8.0,
                    children: [
                      Icon(Icons.qr_code),
                      Text(
                        "DIGICARD",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                DrawerMenu(
                  leading: Image.asset('assets/icons/cards.png', width: 24),
                  selected: currentIndex == 0,
                  title: "Cards",
                  onTap: () async {
                    viewModel.setIndex(0);
                  },
                ),
                const SizedBox(height: 8.0),
                DrawerMenu(
                    leading: Image.asset(
                      'assets/icons/scan.png',
                      width: 24,
                    ),
                    selected: currentIndex == 1,
                    title: "Scan",
                    onTap: () async {
                      viewModel.setIndex(1);
                    }),
                const SizedBox(height: 8.0),
                /*    DrawerMenu(
                  leading: Image.asset(
                    'assets/icons/contacts.png',
                    width: 24,
                  ),
                  selected: currentIndex == 2,
                  title: "Contacts",
                  onTap: () async {
                    viewModel.setIndex(2);
                  },
                ), */

                DrawerMenu(
                  leading: Image.asset(
                    'assets/icons/settings.png',
                    width: 24,
                  ),
                  selected: currentIndex == 2,
                  title: "Settings",
                  onTap: () async {
                    viewModel.setIndex(2);
                  },
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
