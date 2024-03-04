import 'package:flutter/material.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/arrow_down_icon.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/location_text_and_address.dart';

class AddressButtonWidget extends StatelessWidget {
  const AddressButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        LocationTextAndAddress(),
        ArrowDownIcon(),
      ],
    );
  }
}
