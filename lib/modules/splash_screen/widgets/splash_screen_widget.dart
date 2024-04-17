import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/loading_progress_indicator.dart';
import 'package:market_app/core/styles/colors.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: const LoadingProgressIndicator(),
      ),
    );
  }
}
