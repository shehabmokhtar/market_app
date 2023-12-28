import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
            size: AppSizes.screenWidth(context) * .08,
          )),
    );
  }
}
