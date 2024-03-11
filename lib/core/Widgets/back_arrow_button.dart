import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class BackArrowButton extends StatelessWidget {
  final bool? isWite;
  const BackArrowButton({
    super.key,
    this.isWite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: isWite! ? AppColors.white : AppColors.primaryColor,
            size: AppSizes.iconSize(context),
          )),
    );
  }
}
