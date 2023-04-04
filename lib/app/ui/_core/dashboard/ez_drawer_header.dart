import 'package:digicard/app/constants/colors.dart';
import 'package:flutter/material.dart';

class EZDrawerHeader extends StatelessWidget {
  final Widget? currentAccountPicture;
  final String userName;
  final String userEmail;
  final Color? bgColor;
  const EZDrawerHeader(
      {Key? key,
      this.currentAccountPicture,
      this.userName = "N/A",
      this.userEmail = "N/A",
      this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      currentAccountPicture: currentAccountPicture,
      accountEmail: Text(
        userEmail,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      accountName: Text(
        userName,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      otherAccountsPictures: null,
      margin: const EdgeInsets.only(bottom: 0.0),
      otherAccountsPicturesSize: const Size(0.0, 0.0),
      decoration: const BoxDecoration(
          backgroundBlendMode: BlendMode.darken, color: kcPrimaryColor),
    );
  }
}
