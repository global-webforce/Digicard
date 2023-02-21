// ignore_for_file: implementation_imports
import 'dart:ui';

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:digicard/app/shared/constants/dimensions.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [HexColor("#F09819"), HexColor("##FF512F")],
            tileMode: TileMode.clamp,
          ),
        ),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
              child: Padding(
            padding: Dimens.sliverPaddingForm(constraints),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Wrap(direction: Axis.horizontal, children: const [
                        Text(
                          "   DIGICARD",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'TM',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontFeatures: [FontFeature.superscripts()]),
                        ),
                      ]),
                      const Icon(
                        Icons.qr_code_2_rounded,
                        size: 100,
                        color: Colors.white,
                      ),
                      const Text(
                        "Create a business card for every \nsituation",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      EzButton.elevated(
                        title: "CREATE MY CARDS",
                        onTap: () {
                          context.pushRoute(const LoginRoute());
                        },
                      ),
                      vSpaceRegular,
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "SIGN-IN",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
        }),
      ),
    );
  }
}
