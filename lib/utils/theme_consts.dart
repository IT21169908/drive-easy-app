import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_scheme.dart';

class ThemeConsts {
  static const Color appPrimaryYellow = Color(0xffF79515);
  static const Color appPrimaryBlue = Color(0xff4E74F9);
  static const Color appPrimaryLightYellow = Color(0xffF8EEC0);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4744E8)),
    colorScheme: lightColorScheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0x1492dbff),
      isDense: true,
      labelStyle: GoogleFonts.rubik(
        fontSize: 14,
        height: 1.5,
        color: const Color(0xff8B8B8B),
      ),
      hintStyle: GoogleFonts.rubik(
        fontSize: 14,
        height: 1.5,
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: lightColorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: lightColorScheme.error),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: lightColorScheme.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: lightColorScheme.primary),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xff4E74F9),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
  );
}
