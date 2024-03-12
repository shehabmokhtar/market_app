import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/widgets/custom_drop_down_menu_with_title.dart';

class AddAddressScreenContent extends StatelessWidget {
  AddAddressScreenContent({
    super.key,
  });
  String? countryValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
      child: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          CustomDrowDownMenuWithTitle(
              title: 'Country',
              value: '',
              items: const [],
              onChanged: (value) {})
        ],
      ),
    );
  }
}
