import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/slider/slider_item.dart';

class SliderList extends StatelessWidget {
  const SliderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 10,
      ),
      child: CarouselSlider(
        items: List.generate(
          5,
          (index) => const SliderItem(),
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
