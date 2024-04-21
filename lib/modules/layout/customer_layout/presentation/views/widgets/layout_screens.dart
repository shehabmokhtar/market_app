import 'package:flutter/material.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/views/customer_favorites_screen.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/customer_home_screen.dart';
import 'package:market_app/modules/profile/customer_profile/presentation/views/customer_profile_screen.dart';
import 'package:market_app/modules/search/customer_search/presentation/views/customer_search_screen.dart';

List<Widget> customerLayoutScreens = [
  const CustomerHomeScreen(),
  const CustomerSearchScreen(),
  const CustomerFavoritesScreen(),
  const CustomerProfileScreen(),
];
