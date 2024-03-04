import 'package:flutter/material.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/address_name_and_city.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/location_text.dart';

class LocationTextAndAddress extends StatelessWidget {
  const LocationTextAndAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LocationText(),
        SizedBox(
          height: 5,
        ),
        AddressNameAndCity()
      ],
    );
  }
}
