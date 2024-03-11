import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_app/core/styles/colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      colorSchemeSeed: AppColors.primaryColor,
      useMaterial3: true,
      textTheme: GoogleFonts.cairoTextTheme(),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryColor,
        ),
      ),
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        iconColor: MaterialStatePropertyAll<Color>(AppColors.primaryColor),
      )));
}
