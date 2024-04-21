import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_app/core/styles/colors.dart';

class RecommendedForYouWidget extends StatelessWidget {
  const RecommendedForYouWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 15),
          child: Text(
            'Recommended For You',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              // color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            // itemBuilder: (context, index) =>  ProductWidget(),
            itemBuilder: (context, index) => Container(),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}
