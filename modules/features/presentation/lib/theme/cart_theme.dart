import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:presentation/theme/instances/theme_instances.dart';

const defaultCornerRadius = 12.0;

final cartLightTheme = _createCartThemeData(
  accentColor: ThemeInstances.colorPallete.primary,
  brightness: Brightness.light,
  primarySwatch: Colors.purple,
  textTheme: _createTextTheme(brightness: Brightness.light),
);

final cartDarkTheme = _createCartThemeData(
  accentColor: ThemeInstances.colorPallete.light,
  brightness: Brightness.dark,
  primarySwatch: Colors.grey,
  textTheme: _createTextTheme(brightness: Brightness.dark),
);

TextTheme _createTextTheme({
  required Brightness brightness,
}) {
  return GoogleFonts.sourceSansProTextTheme()
      .copyWith(
        labelLarge: GoogleFonts.sourceSansProTextTheme()
            .labelLarge!
            .copyWith(fontWeight: FontWeight.bold),
      )
      .apply(
        bodyColor: brightness == Brightness.light
            ? ThemeData.light().textTheme.bodyLarge!.color
            : ThemeData.dark().textTheme.bodyLarge!.color,
        displayColor: brightness == Brightness.light
            ? ThemeData.light().textTheme.bodySmall!.color
            : ThemeData.dark().textTheme.bodySmall!.color,
      );
}

ThemeData _createCartThemeData({
  required Color accentColor,
  required Brightness brightness,
  required MaterialColor primarySwatch,
  required TextTheme textTheme,
}) {
  final primaryColor =
      brightness == Brightness.light ? primarySwatch : primarySwatch[300];

  return ThemeData(
    scaffoldBackgroundColor: brightness == Brightness.light
        ? ThemeInstances.colorPallete.midGray[50]
        : null,
    primaryColor: primaryColor,
    canvasColor: brightness == Brightness.light ? Colors.white : null,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultCornerRadius),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: brightness == Brightness.light ? 1.5 : 0,
      centerTitle: false,
      titleSpacing: 0,
      toolbarHeight: 98,
      titleTextStyle: textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: accentColor,
      ),
      color: brightness == Brightness.light ? Colors.white : null,
      iconTheme: IconThemeData(color: accentColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: brightness == Brightness.light ? Colors.white : null,
      selectedItemColor: primaryColor,
      unselectedItemColor:
          brightness == Brightness.light ? Colors.black38 : Colors.white38,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle:
          const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      unselectedLabelStyle:
          const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    ),
    textTheme: textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: _createTextTheme(
          brightness: brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light,
        ).labelLarge!.color,
        backgroundColor: primaryColor,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultCornerRadius),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultCornerRadius),
        ),
        side: BorderSide(color: primaryColor!),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
      ),
    ),
    radioTheme: RadioThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      fillColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return primaryColor;
          }

          return brightness == Brightness.light
              ? Colors.black12
              : Colors.white24;
        },
      ),
    ),
    sliderTheme: const SliderThemeData(
      rangeThumbShape:
          RoundRangeSliderThumbShape(enabledThumbRadius: 12, elevation: 3),
      thumbColor: Colors.white,
      trackHeight: 5,
    ),
    cardTheme: _createFlatCardTheme(brightness),
    snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(
          color:
              brightness == Brightness.light ? Colors.black12 : Colors.white12,
        ),
      ),
      hintStyle: textTheme.bodyLarge!.copyWith(
        color: brightness == Brightness.light ? Colors.black38 : Colors.white38,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(primarySwatch),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: const BorderSide(color: Colors.grey),
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: primarySwatch,
      accentColor: accentColor,
      brightness: brightness,
    ).copyWith(
        error:
            brightness == Brightness.light ? Colors.red : Colors.red.shade300),
  );
}

CardTheme _createFlatCardTheme(Brightness brightness) => CardTheme(
      color: brightness == Brightness.light ? Colors.transparent : null,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(defaultCornerRadius),
        side: brightness == Brightness.light
            ? const BorderSide(width: 0.5, color: Colors.black12)
            : BorderSide.none,
      ),
    );
