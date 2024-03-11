import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        image: const DecorationImage(
          image: NetworkImage(
              'https://kimola.com/images/mh/posts/6f80b6a5-41db-4465-abae-18e5526862f9.webp'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
