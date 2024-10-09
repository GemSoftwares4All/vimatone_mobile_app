import 'package:flutter/material.dart';
import 'package:vimatone/Config/Extras.dart';

class AppTheme {
  static final light_theme = ThemeData(
    useMaterial3: true,
    fontFamily: "Fredoka",
    brightness: Brightness.light,
    colorSchemeSeed: color_tetiary,
  ).copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: color_primary,
    ),
    scaffoldBackgroundColor: color_background,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: color_gray),
      contentPadding: EdgeInsets.all(padding_md),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius_md),
        borderSide: BorderSide(
          width: 1,
          color: color_gray,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius_md),
        borderSide: BorderSide(
          width: 1,
          color: color_gray,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius_md),
        borderSide: BorderSide(
          color: color_secondary,
          width: 1,
        ),
      ),
    ),
  );
}
