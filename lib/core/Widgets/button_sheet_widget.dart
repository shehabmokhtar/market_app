import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

class BottomSheetWidget extends StatelessWidget {
  final Widget child;
  const BottomSheetWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.screenHeight(context) / 2,
      child: child,
    );
  }
}
