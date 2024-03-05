import 'package:flutter/material.dart';
import 'package:market_app/core/constants/variables.dart';
import 'package:market_app/modules/layout/customer_layout/presentation/views/widgets/bottom_nav_item.dart';

// ignore: must_be_immutable
class CustomerNavBar extends StatelessWidget {
  int currentIndex;
  Function onTap;
  CustomerNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        onTap(value);
      },
      items: bottomnavigationBarItems,
    );
  }

  List<BottomNavigationBarItem> bottomnavigationBarItems = [
    customBottomNavigationBarItem(
      icon: Icons.home_outlined,
      label: 'Home',
    ),
    customBottomNavigationBarItem(
      icon: Icons.search_outlined,
      label: 'Search',
    ),
    customBottomNavigationBarItem(
      icon: Icons.card_giftcard_sharp,
      label: 'Promotions',
    ),
    customBottomNavigationBarItem(
      icon: Icons.favorite_outline,
      label: 'Favorites',
    ),
    customBottomNavigationBarItem(
      icon: Icons.person_outline,
      label: 'Profile',
    ),
  ];
}
