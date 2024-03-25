import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  // Orange
  static const Color primaryColor = Color(0xff025959);
  static Color secondColor = HexColor('#FA7F08');
  static Color thirdColor = HexColor('#9EF8EE');
  static Color fourthColor = HexColor('#22BABB');
  // Gray
  static Color fifthColor = HexColor('#E2E2E2');
  // Red
  static const Color errorColor = Color(0xff850101);
  // Green
  static const Color successColor = Color(0xff056608);
  // Yellow
  static Color warningColor = HexColor('#F6BE00');

  // Additional colors
  static const Color textColor = Colors.black;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static Color lightPrimaryColor = AppColors.primaryColor.withOpacity(.07);
  static Color lightGray = Colors.grey.withOpacity(.5);
}
