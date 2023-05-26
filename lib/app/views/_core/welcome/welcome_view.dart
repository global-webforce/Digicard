// ignore_for_file: implementation_imports
import 'dart:ui';
import 'package:auto_route/annotations.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/routes/app_router.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/ui/_core/ez_button.dart';
import 'package:digicard/app/constants/dimensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

@RoutePage()
class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
    if (!kIsWeb) FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffF09819),
              Color(0xffFF512F),
            ],
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
                        "Create a business card for \nevery situation",
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
                          locator<AppRouter>().push(LoginRoute());
                        },
                      ),
                      /*        vSpaceRegular,
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "SIGN-IN",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ), */
                      const SizedBox(
                        height: 30,
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
