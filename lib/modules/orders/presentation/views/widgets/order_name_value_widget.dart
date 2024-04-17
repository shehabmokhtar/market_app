import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';

class OrderNameValueWidget extends StatelessWidget {
  const OrderNameValueWidget({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(
            text: '$text: ',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            )),
        TextSpan(
          text: value,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ],
    ));
  }
}
