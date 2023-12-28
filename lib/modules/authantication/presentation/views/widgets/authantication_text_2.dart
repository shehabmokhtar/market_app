import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

class AuthanticationText2 extends StatelessWidget {
  final String text;
  const AuthanticationText2({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: AppSizes.regularTextStyle(context),
      );
}
