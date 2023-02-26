import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';

Widget appIcon() {
  return Row(
    children: [
      const Icon(
        Icons.qr_code_2_rounded,
        size: 30,
        color: Colors.white,
      ),
      const SizedBox(
        width: 10,
      ),
      const Text("DIGICARD"),
      hSpaceSmall,
      Container(
          decoration: BoxDecoration(
              color: kcPrimaryColor, borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: Text(
              "PRO",
              style: TextStyle(color: Colors.black),
            ),
          )),
    ],
  );
}
