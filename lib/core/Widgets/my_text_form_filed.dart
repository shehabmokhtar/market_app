import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

// ignore: must_be_immutable
class MyTextFormFiled extends StatefulWidget {
  TextEditingController controller;
  TextInputType textInputType;
  IconData prefixIcon;
  bool _obscureText = true;
  bool isPassword;
  String hintText;

  MyTextFormFiled({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
  });

  @override
  State<MyTextFormFiled> createState() => _MyTextFormFiledState();
}

class _MyTextFormFiledState extends State<MyTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(
        vertical: 10,
      ),
      padding: EdgeInsetsDirectional.only(
        end: widget.isPassword ? 0 : 10,
      ),
      height: (16 + AppSizes.screenWidth(context) * .04).clamp(55, 65),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.fifthColor,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius)),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        maxLines: 1,
        obscureText: widget.isPassword ? widget._obscureText : false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.prefixIcon,
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
                  ),
                )
              : null,
          border: InputBorder.none, // Remove underline
          hintText: widget.hintText,
          hintStyle: AppSizes.regularTextStyle(context),
        ),
      ),
    );
  }
}
