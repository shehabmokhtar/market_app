import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/back_arrow_button.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

AppBar customAppBar({
  required BuildContext context,
  required String title,
}) =>
    AppBar(
      backgroundColor: AppColors.primaryColor,
      leading: const BackArrowButton(isWite: true),
      title: Text(
        title,
        style: AppSizes.regularTextStyle(context).copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
