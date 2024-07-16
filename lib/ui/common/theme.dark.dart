import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: GoogleFonts.poppins().fontFamily,
  useMaterial3: true,
  brightness: Brightness.dark,
  drawerTheme: const DrawerThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)))),
  inputDecorationTheme: const InputDecorationTheme(
      // isDense: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      filled: true),
  colorScheme: ColorScheme.fromSeed(
    seedColor: kcPrimaryColor,
    brightness: Brightness.dark,
  ).copyWith(
    brightness: Brightness.dark,
  ),
);
