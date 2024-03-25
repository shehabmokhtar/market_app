import 'package:flutter/material.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/customer_addresses_screen.dart';

class EditAddresesButton extends StatelessWidget {
  const EditAddresesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        AppUtilities.navigateToNewPage(
          context: context,
          newPage: CustomerAddressesScreen(),
        );
      },
      child: Text(
        'Edit Addresses',
        style: AppSizes.smallTextStyle(context).copyWith(
          color: AppColors.primaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
