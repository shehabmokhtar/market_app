import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class AddressDiscription extends StatelessWidget {
  const AddressDiscription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Istanbul, Uskudar,Istanbul, Uskudar,Istanbul, Uskudar,Istanbul, Uskudar,',
      style: AppSizes.smallTextStyle(context).copyWith(
        color: AppColors.black.withOpacity(.7),
      ),
    );
  }
}
