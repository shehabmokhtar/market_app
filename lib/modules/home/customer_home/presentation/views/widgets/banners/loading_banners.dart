import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/banners/loading_banner_item.dart';

class CustomBannersList extends StatelessWidget {
  const CustomBannersList({super.key, this.isLoading = true});
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 10,
      ),
      child: CarouselSlider(
        items: List.generate(
          1,
          (index) => LoadingBannerItem(isLoading: isLoading),
        ),
        options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.decelerate,
            enlargeFactor: .28,
            autoPlayInterval: const Duration(seconds: 5)),
      ),
    );
  }
}
