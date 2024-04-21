import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

// ignore: must_be_immutable
class OrderSectionDetails extends StatelessWidget {
  OrderSectionDetails({
    super.key,
    required this.sectionTitle,
    required this.sectionBody,
    this.onTap,
  });

  final String sectionTitle;
  Widget sectionBody;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The title of the section
          Text(
            sectionTitle,
            style: AppSizes.regularTextStyle(context),
          ),
          // The section details
          Container(
            width: double.infinity,
            margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
            padding: const EdgeInsetsDirectional.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGray, width: 1.5),
                borderRadius: BorderRadius.circular(AppSizes.borderRadius)),
            child: InkWell(
              onTap: () {
                onTap!();
              },
              child: sectionBody,
            ),
          ),
        ],
      ),
    );
  }
}
