import 'package:ez_onboarding/src/onboard_explorer.dart';
import 'package:ez_onboarding/src/onboard_item.dart';
import 'package:ez_onboarding/src/onboard_carousel.dart';
import 'package:flutter/material.dart';

class OnboardApp extends StatelessWidget {
  final Function onDone;
  final List<OnboardItem> pages;
  final bool carouselMode;
  const OnboardApp(
      {Key? key,
      required this.pages,
      required this.onDone,
      this.carouselMode = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return carouselMode
        ? OnBoardCarousel(pages: pages, onDone: onDone)
        : OnboardExplorer(pages: pages, onDone: onDone);
  }
}
