import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

// ignore: must_be_immutable
class ProfileItem extends StatelessWidget {
  String title;
  final IconData icon;
  Function onTap;
  bool isButton;

  ProfileItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: isButton
          ? AppColors.primaryColor.withOpacity(.1)
          : Colors.transparent,
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: 42,
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(
                icon,
                size: AppSizes.iconSize(context),
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppSizes.smallTextStyle(
                  context,
                ).copyWith(
                  color: Colors.black.withOpacity(.8),
                ),
              ),
              if (isButton) const Spacer(),
              if (isButton)
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black.withOpacity(.7),
                  size: 15,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
