import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

// ignore: must_be_immutable
class MyMainButton extends StatefulWidget {
  BuildContext context;
  Function onTap;
  String title;

  MyMainButton({
    super.key,
    required this.context,
    required this.onTap,
    required this.title,
  });

  @override
  State<MyMainButton> createState() => _MyMainButtonState();
}

class _MyMainButtonState extends State<MyMainButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        height: (16 + AppSizes.screenWidth(context) * .04).clamp(55, 65),
        width: double.infinity,
        decoration: BoxDecoration(
            color: true ? AppColors.primaryColor : AppColors.fifthColor,
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor,
                offset: const Offset(2, 4),
                blurRadius: 15,
              )
            ]),
        child: Center(
            child: Text(
          widget.title,
          style: AppSizes.regularTextStyle(context).copyWith(
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
