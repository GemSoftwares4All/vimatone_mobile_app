import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';

class AppTheme {
  static final light_theme = ThemeData(
    fontFamily: "Fredoka",
    brightness: Brightness.light,
    colorSchemeSeed: Extras.tetiary,
  ).copyWith(
    scaffoldBackgroundColor: Extras.background,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Extras.text),
      contentPadding: EdgeInsets.all(Extras.padding_md),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Extras.radius_md),
        borderSide: BorderSide(
          width: 1,
          color: Extras.gray,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Extras.radius_md),
        borderSide: BorderSide(
          color: Extras.secondary,
          width: 1,
        ),
      ),
    ),
  );
}
