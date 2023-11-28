import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: GoogleFonts.varelaRound().fontFamily,
  useMaterial3: true,
  brightness: Brightness.light,
  drawerTheme: const DrawerThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)))),
  inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      filled: true),
  colorScheme: ColorScheme.fromSeed(
    seedColor: kcPrimaryColor,
    brightness: Brightness.light,
  ).copyWith(
    brightness: Brightness.light,
  ),
);
