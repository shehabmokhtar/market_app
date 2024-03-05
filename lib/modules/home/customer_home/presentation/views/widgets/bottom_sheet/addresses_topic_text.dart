import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

class AddresesTopicText extends StatelessWidget {
  const AddresesTopicText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Addresses',
      style: AppSizes.regularTextStyle(
        context,
        isBold: true,
      ),
    );
  }
}
