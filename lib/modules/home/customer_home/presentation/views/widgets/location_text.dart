import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

class LocationText extends StatelessWidget {
  const LocationText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Adress',
      style: AppSizes.smallTextStyle(context).copyWith(
        color: Colors.black.withOpacity(.7),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
