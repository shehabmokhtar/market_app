import 'package:flutter/material.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/address_city_widget.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/address_name_widget.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/location_pin_icon.dart';

class AddressNameAndCity extends StatelessWidget {
  const AddressNameAndCity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        LocationPinIcon(),
        SizedBox(
          width: 1,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AddressNameWidget(),
            AddresCitysWidget(),
          ],
        )
      ],
    );
  }
}
