import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:market_app/core/Widgets/custom_text_form_filed.dart';
import 'package:market_app/core/styles/sizes.dart';

class CustomTextFormFiledWithTitle extends StatelessWidget {
  CustomTextFormFiledWithTitle({
    super.key,
    required this.title,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    this.textInputType = TextInputType.text,
  });
  final String title;
  final String hintText;
  final IconData prefixIcon;
  TextEditingController controller;
  TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppSizes.regularTextStyle(context),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 5, top: 3),
          child: CustomTextFormFiled(
            textInputType: textInputType,
            controller: controller,
            prefixIcon: prefixIcon,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
