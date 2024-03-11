import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/styles/colors.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Profile',
        disableBackArrow: true,
        titleColor: AppColors.black,
        isBackgroundColorWhite: true,
      ),
      body: const Center(child: Text('Customer Profile Screen')),
    );
  }
}
