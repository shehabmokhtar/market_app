import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Profile app bar
      appBar: customAppBar(
        context: context,
        title: 'Profile',
        disableBackArrow: true,
        titleColor: AppColors.black,
        isBackgroundColorWhite: true,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 15,
          end: 15,
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(
                  AppSizes.borderRadius,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    // color: Colors.amber,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.home_outlined,
                            size: AppSizes.iconSize(context),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Profile',
                            style: AppSizes.smallTextStyle(
                              context,
                            ).copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
