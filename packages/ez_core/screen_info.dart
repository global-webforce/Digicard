import 'package:flutter/material.dart';

class ScreenInfo {
  MediaQueryData? _mediaQueryData;

  bool isSizeBetween(BuildContext context, double minWidth, double maxWidth) {
    _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData!.size.width;
    bool isSizeBetween = false;
    if (screenWidth >= minWidth && screenWidth <= maxWidth) {
      isSizeBetween = true;
    }
    return isSizeBetween;
  }

  ScreenInfo(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    isPortrait = _mediaQueryData!.orientation == Orientation.portrait
        ? () {
            isLandscape = false;
            return true;
          }()
        : () {
            isLandscape = true;
            return false;
          }();

    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    isMobile = isSizeBetween(context, mobile.minWidth, mobile.maxWidth);
    isTablet = isSizeBetween(context, tablet.minWidth, tablet.maxWidth);
    isTabletX2 = isSizeBetween(context, tabletX2.minWidth, tabletX2.maxWidth);
    isDesktop = isSizeBetween(context, desktop.minWidth, desktop.maxWidth);
    isDesktopX2 =
        isSizeBetween(context, desktopX2.minWidth, desktopX2.maxWidth);
  }

  double screenWidth = 0;
  double screenHeight = 0;

  bool isPortrait = false;
  bool isLandscape = false;

  bool isMobile = false;
  ScreenSize mobile = ScreenSize(minWidth: 1, maxWidth: 767);

  bool isTablet = false;
  ScreenSize tablet = ScreenSize(minWidth: 768, maxWidth: 1023);

  bool isTabletX2 = false;
  ScreenSize tabletX2 = ScreenSize(minWidth: 1024, maxWidth: 1280);

  bool isDesktop = false;
  ScreenSize desktop = ScreenSize(minWidth: 1281, maxWidth: 1366);

  bool isDesktopX2 = false;
  ScreenSize desktopX2 = ScreenSize(minWidth: 1361, maxWidth: 9999);
}

class ScreenSize {
  final double minWidth;
  final double maxWidth;
  ScreenSize({required this.minWidth, required this.maxWidth});
}
