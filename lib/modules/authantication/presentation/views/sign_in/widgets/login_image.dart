import 'package:flutter/material.dart';
import 'package:market_app/core/styles/responsive.dart';

AspectRatio loginImage(context) {
  return AspectRatio(
      aspectRatio: Responsive.isDesktop(context) ? 3 / 2 : 1,
      child: Image.asset(
        'assets/images/sign_in.png',
        fit: BoxFit.contain,
      ));
}
