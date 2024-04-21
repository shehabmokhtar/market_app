import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

// ignore: must_be_immutable
class Responsive extends StatelessWidget {
  Widget mobile;
  Widget tablet;
  Widget desktop;

  Responsive({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    super.key,
  });

  static bool isMobile(BuildContext context) =>
      AppSizes.screenWidth(context) <= 450;

  static bool isTablet(BuildContext context) =>
      AppSizes.screenWidth(context) > 450 &&
      AppSizes.screenWidth(context) <= 1100;

  static bool isDesktop(BuildContext context) =>
      AppSizes.screenWidth(context) >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 450) {
          return mobile;
        } else if (constraints.maxWidth <= 1100) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
