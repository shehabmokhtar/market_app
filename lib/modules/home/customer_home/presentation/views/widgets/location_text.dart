import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

class LocationText extends StatelessWidget {
  const LocationText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Location',
      style: AppSizes.regularTextStyle(context)
          .copyWith(color: Colors.black.withOpacity(.7)),
    );
  }
}
