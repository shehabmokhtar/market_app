import 'package:flutter/material.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

// ignore: must_be_immutable
class MyMainButton extends StatefulWidget {
  final BuildContext context;
  Function onTap;
  final String title;
  final EdgeInsetsGeometry margin;

  MyMainButton({
    super.key,
    required this.context,
    required this.onTap,
    required this.title,
    this.margin = const EdgeInsetsDirectional.all(0),
  });

  @override
  State<MyMainButton> createState() => _MyMainButtonState();
}

class _MyMainButtonState extends State<MyMainButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: InkWell(
        onTap: () {
          AppUtilities.vibration();
          widget.onTap();
        },
        child: Container(
          height: (AppSizes.screenWidth(context) * .04).clamp(55, 65),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
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
      ),
    );
  }
}
