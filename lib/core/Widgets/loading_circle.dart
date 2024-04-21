import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';

// ignore: must_be_immutable
class LoadingCircle extends StatelessWidget {
  double? height;
  double? width;
  double strokeWidth;
  Color color;
  LoadingCircle({
    super.key,
    this.strokeWidth = 4,
    this.height,
    this.width,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          color: color,
        ),
      ),
    );
  }
}
