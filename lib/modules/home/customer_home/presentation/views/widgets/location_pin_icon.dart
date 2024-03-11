import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

class LocationPinIcon extends StatelessWidget {
  const LocationPinIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.location_pin,
      size: AppSizes.iconSize(context),
    );
  }
}
