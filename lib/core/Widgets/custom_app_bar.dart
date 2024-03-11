import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/back_arrow_button.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

AppBar customAppBar({
  required BuildContext context,
  required String title,
  bool disableBackArrow = false,
  Color titleColor = AppColors.white,
  bool isBackgroundColorWhite = false,
}) =>
    AppBar(
      backgroundColor:
          isBackgroundColorWhite ? AppColors.white : AppColors.primaryColor,
      leading:
          disableBackArrow ? Container() : const BackArrowButton(isWite: true),
      title: Text(
        title,
        style: AppSizes.regularTextStyle(context).copyWith(
          color: titleColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
