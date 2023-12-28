import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

class ResendOtpInSeconds extends StatefulWidget {
  const ResendOtpInSeconds({super.key});

  @override
  State<ResendOtpInSeconds> createState() => _ResendOtpInSecondsState();
}

class _ResendOtpInSecondsState extends State<ResendOtpInSeconds> {
  bool canResendCode = false;
  int timer = 120;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Center(
            child: Text(
              "Resend in ${timerDown()} s",
              style: AppSizes.smallTextStyle(context),
            ),
          ),
          if (timer == 0)
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resend Code',
                  )),
            ),
        ],
      );

  int timerDown() {
    if (timer > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        timer--;
        setState(() {});
      });
      return timer;
    }
    return timer;
  }
}
