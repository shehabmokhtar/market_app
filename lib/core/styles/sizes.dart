import 'package:flutter/material.dart';

class AppSizes {
  static double screenHeight(context) => MediaQuery.of(context).size.height;
  static double screenWidth(context) => MediaQuery.of(context).size.width;
  static double borderRadius = 10;

  // Font sizes
  static double _smallFontSize(context) =>
      (16 + screenWidth(context) * .002).clamp(10, 15);
  static double _regularFontSize(context) =>
      (16 + screenWidth(context) * .009).clamp(20, 30);
  static double _largeFontSize(context) => 16 + screenWidth(context) * .04;
  static double iconSize(context) => (screenWidth(context) * .07).clamp(20, 30);

  // Font weights
  static const FontWeight _regularFontWeight = FontWeight.w400;
  static const FontWeight _boldFontWeight = FontWeight.w600;
  static const FontWeight _extraBoldFontWeight = FontWeight.w600;

  // Text styles
  static TextStyle smallTextStyle(context) => TextStyle(
        fontSize: _smallFontSize(context),
        fontWeight: _regularFontWeight,
        color: Colors.black,
      );

  static TextStyle regularTextStyle(context) => TextStyle(
        fontSize: _regularFontSize(context),
        fontWeight: _regularFontWeight,
        color: Colors.black,
      );

  static TextStyle largeTextStyle(context) => TextStyle(
        fontSize: _largeFontSize(context),
        fontWeight: _boldFontWeight,
        color: Colors.black,
      );
}
