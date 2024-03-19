import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

// ignore: must_be_immutable
class CustomTextFormFiled extends StatefulWidget {
  TextEditingController controller;
  TextInputType textInputType;
  IconData prefixIcon;
  bool _obscureText = true;
  bool isPassword;
  String validationMessage;
  String hintText;

  CustomTextFormFiled({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.validationMessage = '',
  });

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(
        vertical: 7.5,
      ),
      padding: EdgeInsetsDirectional.only(
        end: widget.isPassword ? 0 : 10,
      ),
      constraints: const BoxConstraints(
        // minHeight: (16 + AppSizes.screenWidth(context) * .04).clamp(55, 65),
        minHeight: 50,
        maxHeight: double.infinity,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        // color: AppColors.fifthColor,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        validator: (value) {
          if (value!.isEmpty) {
            return widget.validationMessage;
          }
          return null;
        },
        maxLines: 1,
        obscureText: widget.isPassword ? widget._obscureText : false,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: Icon(
            widget.prefixIcon,
            color: Colors.grey,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget._obscureText = !widget._obscureText;
                    });
                  },
                  icon: Icon(
                    widget._obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: widget._obscureText
                        ? AppColors.primaryColor
                        : Colors.black,
                  ),
                )
              : null,
          border: InputBorder.none, // Remove underline
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          // ),
          hintText: widget.hintText,
          hintStyle:
              AppSizes.regularTextStyle(context).copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
