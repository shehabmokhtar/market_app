import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:market_app/core/constants/animation_constants.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          LottieBuilder.asset(AnimationConstants.canceled),
          LottieBuilder.asset(AnimationConstants.preparing),
          LottieBuilder.asset(AnimationConstants.reviewing),
          LottieBuilder.asset(AnimationConstants.delivering),
          LottieBuilder.asset(AnimationConstants.delivered),
        ],
      ),
    );
  }
}
