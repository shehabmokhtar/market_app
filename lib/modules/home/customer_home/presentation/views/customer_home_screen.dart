import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/customer_home_app_bar.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/banners/banner_item.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/banners/banners_list.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          // The top home screen app bar
          CustomerHomeAppBar(),
          // The slider list
          BannersList(),
        ],
      ),
    );
  }
}
