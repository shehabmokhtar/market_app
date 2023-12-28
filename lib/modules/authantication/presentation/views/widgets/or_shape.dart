import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

class OrShape extends StatelessWidget {
  const OrShape({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 15,
        ),
        child: Row(
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
        ),
      );
}
