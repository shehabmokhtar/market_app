import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/loading_progress_indicator.dart';
import 'package:market_app/core/styles/colors.dart';

class CustomerSplashScreen extends StatelessWidget {
  const CustomerSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: preApp(),
      builder: (context, snapshot) => Scaffold(
        body: Container(
          color: AppColors.primaryColor,
          child: const LoadingProgressIndicator(),
        ),
      ),
    );
  }

  preApp() {
    Future.delayed(const Duration(seconds: 3));
    return true;
  }
}
