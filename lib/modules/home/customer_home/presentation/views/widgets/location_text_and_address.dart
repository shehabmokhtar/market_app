import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/address_name_and_city.dart';

class LocationTextAndAddress extends StatelessWidget {
  const LocationTextAndAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Adress',
          style: AppSizes.smallTextStyle(context).copyWith(
            color: Colors.black.withOpacity(.7),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const AddressNameAndCity()
      ],
    );
  }
}
