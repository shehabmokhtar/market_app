import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

class NotificationsButton extends StatelessWidget {
  const NotificationsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.notifications_none_outlined,
        size: AppSizes.iconSize(context),
      ),
    );
  }
}
