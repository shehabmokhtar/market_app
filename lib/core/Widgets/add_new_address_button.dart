import 'package:flutter/material.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/customer_add_new_address_screen.dart';
import 'package:page_transition/page_transition.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          AppUtilities.navigateToNewPage(
            context: context,
            newPage: const CustomerAddNewAddressScreen(),
            pageTransitionType: PageTransitionType.rightToLeft,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add Address',
              style: AppSizes.regularTextStyle(context)
                  .copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(Icons.add),
          ],
        ));
  }
}
