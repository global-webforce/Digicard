
import 'package:flutter/material.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function() onSignOut;
  final num cartCount;
  final Function() onCartTap;
  const AppBarWidget(
      {super.key,
      required this.onSignOut,
      required this.onCartTap,
      this.cartCount = 0});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Text(
        "DionnieBee",
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () async {
            onSignOut();
          },
        ),
      
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
