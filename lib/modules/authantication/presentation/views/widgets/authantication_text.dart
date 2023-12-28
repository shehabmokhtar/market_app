import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

class AuthanticationText extends StatelessWidget {
  final String text;
  const AuthanticationText({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: AppSizes.largeTextStyle(context),
      );
}
