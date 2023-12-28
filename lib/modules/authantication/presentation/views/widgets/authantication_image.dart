import 'package:flutter/material.dart';
import 'package:market_app/core/styles/responsive.dart';

class AuthanticationImage extends StatelessWidget {
  final String imagePath;
  const AuthanticationImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) => AspectRatio(
      aspectRatio: Responsive.isDesktop(context) ? 3 / 2 : 1,
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ));
}
