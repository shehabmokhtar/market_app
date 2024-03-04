import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_app/core/styles/colors.dart';

BottomNavigationBarItem customBottomNavigationBarItem({
  required IconData icon,
  required String label,
}) =>
    BottomNavigationBarItem(
      activeIcon: Icon(
        icon,
        color: AppColors.primaryColor,
      ),
      icon: Icon(
        icon,
        color: Colors.grey,
      ),
      label: label,
    );
