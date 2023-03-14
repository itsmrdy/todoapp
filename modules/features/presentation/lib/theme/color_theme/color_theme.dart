import 'package:flutter/material.dart';

class ColorTheme {
  ColorTheme._();
  static final ColorTheme instance = ColorTheme._();

  /// Color Pallete
  /// CSS Colors
  Color light = Colors.white;
  Color primary = Color(0xfff6025DF);
  Color danger = Colors.red;
  Color success = Colors.green;
  Color warning = Colors.orange;
  Color info = Colors.cyan;
  Color secondary = Colors.grey;
  Color lightSecondary = Color(0xfff0f2f5);
  Color lightPurple = Color(0xffF7F3FF);
  Color dark = Colors.black;
  Color textGrayishColor = Color(0xff9E9E9E);

  MaterialColor midGray = MaterialColor(
    0xFF8B8B8B,
    <int, Color>{
      50: Color(0xFFF8F8F8), // extra light gray
      100: Color(0xFFE5E5E5), // lightest gray
      200: Color(0xFFE0E0E0), // light gray
      300: Color(0xFFB4B4B4), // light mid gray
      400: Color(0xFF9C9C9C),
      500: Color(0xFF8B8B8B),
      600: Color(0xFF838383),
      700: Color(0xFF787878),
      800: Color(0xFF6E6E6E),
      900: Color(0xFF5B5B5B),
    },
  );

  MaterialColor purple = MaterialColor(
    0xFF8B8B8B,
    <int, Color>{
      50: Color(0xFFE6E4EC),
      51: Color(0xFFF5F0FF), // lighter purple #1
      52: Color(0xFFF7F3FF), // lightest purple
      53: Color(0xFFB6A2DF), // light purple
      100: Color(0xFFC2BCD0),
      200: Color(0xFF9990B0),
      300: Color(0xFF706490),
      400: Color(0xFF514279),
      401: Color(0xFF6025DF),
      500: Color(0xFF8B8B8B),
      600: Color(0xFF5020b9), // landing page background color
      700: Color(0xFF4F1FB8), // darker purple
      800: Color(0xFF0D0131), // snackbar background color
      900: Color(0xFF2C1864), // darkest purple
      1000: Color(0xFF322161), // darkest purple #2
    },
  );

  Color carbon = Color(0xFF202020);
  Color red = Color(0xFFFF3C3C);
  Color lightRed = Color(0xFFFFE6E6);
  Color lightLimeGreen = Color(0xFFE1FF67);
  Color limeGreen = Color(0xFFD4FC34);
  Color lightGreen = Color(0xFFE8FFE8);
  Color mediumGreen = Color(0xFF03AD00);
  Color green = Color(0xFF1DC202);

// For the Dark Theme
  Color lilac = Color(0xFF9560FF);
  Color lightPlum = Color(0xFF5945AA);
  Color purpleGray = Color(0xFF3B2E70);
  Color mediumPlum = Color(0xFF271D51);
  Color plum = Color(0xFF1A1335);

  ///For progress bar indicator of cart
  List<Color> saleCartProgressColor = [Color(0xffFF6720), Color(0xffFFCE20)];
}
