import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // The category image
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(.5)),
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://www.shutterstock.com/image-photo/red-supermarket-shopping-basket-full-260nw-1391017517.jpg'),
                  fit: BoxFit.contain,
                )),
          ),
        ),
        // The category title
        const Text(
          'Veg',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
