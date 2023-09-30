import 'package:flutter/material.dart';

import 'color_scheme.dart';

class ThemeConsts {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4744E8)),
    colorScheme: lightColorScheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
  );
}
