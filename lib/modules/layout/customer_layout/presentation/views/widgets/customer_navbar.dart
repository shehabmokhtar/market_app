import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

// ignore: must_be_immutable
class CustomerNavBar extends StatelessWidget {
  int currentIndex;
  Function(int value) onTap;
  CustomerNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 10,
          start: 10,
          end: 10,
          bottom: 12,
        ),
        child: GNav(
            selectedIndex: currentIndex,
            onTabChange: (value) {
              AppUtilities.vibration(duration: 15);
              onTap(value);
            },
            rippleColor: AppColors.primaryColor
                .withOpacity(.2), // tab button ripple color when pressed
            tabBorderRadius: AppSizes.borderRadius,
            // tabBorder: Border.all(
            //     color: Colors.black12, width: 0.5), // tab button border
            // tab animation curves
            duration:
                const Duration(milliseconds: 250), // tab animation duration
            gap: 5, // the tab button gap between icon and text

            color: Theme.of(context).iconTheme.color, // unselected icon color
            activeColor: AppColors.primaryColor, // selected icon and text color
            iconSize: AppSizes.iconSize(context), // tab button icon size
            tabBackgroundColor: AppColors.primaryColor
                .withOpacity(.1), // selected tab background color
            padding: const EdgeInsets.symmetric(
                horizontal: 15, vertical: 7), // navigation bar padding
            tabs: bottomNavBarItems),
      ),
    );
  }

  List<GButton> bottomNavBarItems = const [
    GButton(
      icon: Icons.home_outlined,
      text: 'Home',
    ),
    GButton(
      icon: Icons.search_outlined,
      text: 'Search',
    ),
    GButton(
      icon: Icons.favorite_outline,
      text: 'Favorites',
    ),
    GButton(
      icon: Icons.person_outline,
      text: 'Profile',
    )
  ];
}
