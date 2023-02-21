import 'package:flutter/material.dart';

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

bool isMobile(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return (screenWidth < 768) ? true : false;
}

bool isTablet(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return ((screenWidth >= 768) && (screenWidth <= 1062)) ? true : false;
}

bool isDesktop(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return screenWidth > 1062 ? true : false;
}
