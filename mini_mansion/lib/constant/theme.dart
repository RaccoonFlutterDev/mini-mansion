import 'package:flutter/material.dart';

class AppTheme {
  static const Color backgroundDark = Color(0xFF000000);
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF50BEA0);
  static const Color transparent = Colors.transparent;

  static Color textHint = const Color(0xFF7C7C7C);

  static const Color textDark = Color(0xFF000000);
  static const Color textLight = Color(0xFFFFFFFF);

  static MaterialColor primarySwatch = getColorFromHex(primary.value);

  static MaterialColor getColorFromHex(int hexValue) {
    Map<int, Color> colorMap = {
      50: Color(hexValue),
      100: Color(hexValue),
      200: Color(hexValue),
      300: Color(hexValue),
      400: Color(hexValue),
      500: Color(hexValue),
      600: Color(hexValue),
      700: Color(hexValue),
      800: Color(hexValue),
      900: Color(hexValue),
    };
    return MaterialColor(hexValue, colorMap);
  }
}
