import 'package:flutter/material.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/customer_add_new_address_screen.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/addresses_bottom_sheet_top_bar.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/bottom_sheet_line_widget.dart';
import 'package:page_transition/page_transition.dart';

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
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 50,
            ),
            child: TextButton(
              onPressed: () {
                AppUtilities.navigateToNewPage(
                    context: context,
                    newPage: const CustomerAddNewAddressScreen(),
                    pageTransitionType: PageTransitionType.rightToLeft);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: AppSizes.iconSize(context)),
                  Text('Add Your Address',
                      style: AppSizes.regularTextStyle(context).copyWith(
                        color: AppColors.primaryColor,
                      ))
                ],
              ),
            ),
          )
          //Todo
          // AddressesBottomSheetContent()
        ],
      ),
    );
  }
}
