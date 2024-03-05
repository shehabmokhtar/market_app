import 'package:flutter/material.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/buttom_sheet_address_widget.dart';

class AddressesBottomSheetContent extends StatelessWidget {
  const AddressesBottomSheetContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: List.generate(4, (index) => const ButtomSheetAddressWidget()),
      ),
    );
  }
}
