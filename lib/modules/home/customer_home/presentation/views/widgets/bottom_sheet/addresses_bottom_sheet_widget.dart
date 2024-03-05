import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/addresses_bottom_sheet_content.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/addresses_bottom_sheet_top_bar.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/bottom_sheet_line_widget.dart';

class AdressesBottomSheetWidget extends StatelessWidget {
  const AdressesBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.only(
        top: 15,
        start: 15,
        end: 15,
      ),
      child: Column(
        children: [
          BottomSheetLineWidget(),
          SizedBox(
            height: 15,
          ),
          // the bottom sheet top bar
          AdressesBottomSheetTopBar(),
          // The bottom sheet content
          AddressesBottomSheetContent()
        ],
      ),
    );
  }
}
