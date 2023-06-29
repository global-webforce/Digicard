import 'package:digicard/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  cardTheme: CardTheme(
    margin: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  colorSchemeSeed: kcPrimaryColor,
  bottomSheetTheme: const BottomSheetThemeData(
      elevation: 0, backgroundColor: Colors.transparent),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
    ),
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  inputDecorationTheme: const InputDecorationTheme(
    isDense: true,
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
  ),
);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  cardTheme: CardTheme(
    margin: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  colorSchemeSeed: kcPrimaryColor,
  bottomSheetTheme: const BottomSheetThemeData(
      elevation: 0, backgroundColor: Colors.transparent),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
    ),
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  inputDecorationTheme: const InputDecorationTheme(
    isDense: true,
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
  ),
);
