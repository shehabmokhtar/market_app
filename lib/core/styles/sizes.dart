import 'package:flutter/material.dart';

class AppSizes {
  static double screenHeight(context) => MediaQuery.of(context).size.height;
  static double screenWidth(context) => MediaQuery.of(context).size.width;
  static double borderRadius = 25;

  // Font sizes
  static double _smallFontSize(context) => 16 + screenWidth(context) * .002;
  static double _regularFontSize(context) => 16 + screenWidth(context) * .009;
  static double _largeFontSize(context) => 16 + screenWidth(context) * .04;

  // Font weights
  static const FontWeight regularFontWeight = FontWeight.w400;
  static const FontWeight boldFontWeight = FontWeight.w600;
  static const FontWeight extraBoldFontWeight = FontWeight.w600;

  // Text styles
  static TextStyle smallTextStyle(context) => TextStyle(
        fontSize: _smallFontSize(context),
        fontWeight: regularFontWeight,
        color: Colors.black,
      );

  static TextStyle regularTextStyle(context) => TextStyle(
        fontSize: _regularFontSize(context),
        fontWeight: regularFontWeight,
        color: Colors.black,
      );

  static TextStyle largeTextStyle(context) => TextStyle(
        fontSize: _largeFontSize(context),
        fontWeight: boldFontWeight,
        color: Colors.black,
      );
}
