import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:market_app/modules/home/customer_home/data/models/banner_model.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/banners/banner_item.dart';

// ignore: must_be_immutable
class BannersListItems extends StatelessWidget {
  BannersListItems({
    super.key,
    required this.banners,
  });

  List<BannerModel> banners;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 10,
      ),
      child: CarouselSlider(
        items: List.generate(
          banners.isNotEmpty ? banners.length : 1,
          (index) => banners.isNotEmpty
              ? BannerItem(
                  model: banners[index],
                )
              : const BannerItem(),
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
