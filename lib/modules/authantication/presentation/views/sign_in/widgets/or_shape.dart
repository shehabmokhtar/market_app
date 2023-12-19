import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

Row orShape(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 1,
          color: Colors.grey,
        ),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 5,
        ),
        child: Text(
          'OR',
          style: AppSizes.smallTextStyle(context).copyWith(
            color: Colors.grey,
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: 1,
          color: Colors.grey,
        ),
      ),
    ],
  );
}
