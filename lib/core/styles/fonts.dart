import 'package:flutter/material.dart';

class AppFonts {
  static const String primaryFontFamily = 'Roboto'; // Example font family

  // Font sizes
  static const double smallFontSize = 12.0;
  static const double regularFontSize = 16.0;
  static const double largeFontSize = 20.0;

  // Font weights
  static const FontWeight regularFontWeight = FontWeight.w400;
  static const FontWeight boldFontWeight = FontWeight.w700;
  static const FontWeight extraBoldFontWeight = FontWeight.w800;

  // Text styles
  static const TextStyle smallTextStyle = TextStyle(
    fontSize: smallFontSize,
    fontWeight: regularFontWeight,
    fontFamily: primaryFontFamily,
  );

  static const TextStyle regularTextStyle = TextStyle(
    fontSize: regularFontSize,
    fontWeight: regularFontWeight,
    fontFamily: primaryFontFamily,
  );

  static const TextStyle largeTextStyle = TextStyle(
    fontSize: largeFontSize,
    fontWeight: boldFontWeight,
    fontFamily: primaryFontFamily,
  );
}
