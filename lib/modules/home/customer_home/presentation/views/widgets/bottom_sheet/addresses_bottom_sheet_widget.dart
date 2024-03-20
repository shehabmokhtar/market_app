import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/add_new_address_button.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/addresses_bottom_sheet_content.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/addresses_bottom_sheet_top_bar.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/bottom_sheet_line_widget.dart';

class AdressesBottomSheetWidget extends StatelessWidget {
  const AdressesBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 15,
        start: 15,
        end: 15,
      ),
      child: Column(
        children: [
          const BottomSheetLineWidget(),
          const SizedBox(
            height: 15,
          ),
          // the bottom sheet top bar
          const AdressesBottomSheetTopBar(),
          // The bottom sheet content
          AddressesListItems(),
          // Add address button
          const AddAddressButton(),
        ],
      ),
    );
  }
}
