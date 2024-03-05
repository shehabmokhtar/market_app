import 'package:flutter/material.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/address_discription.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/address_item_title.dart';

class AddressItemNameAndDiscription extends StatelessWidget {
  const AddressItemNameAndDiscription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddressNameItemTitle(),
          AddressDiscription(),
        ],
      ),
    );
  }
}
