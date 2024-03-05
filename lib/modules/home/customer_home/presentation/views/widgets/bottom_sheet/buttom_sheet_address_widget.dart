import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/address_icon.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/address_item_name_and_discription.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/selected_address_radio_icon.dart';

class ButtomSheetAddressWidget extends StatefulWidget {
  const ButtomSheetAddressWidget({
    super.key,
  });

  @override
  State<ButtomSheetAddressWidget> createState() =>
      _ButtomSheetAddressWidgetState();
}

class _ButtomSheetAddressWidgetState extends State<ButtomSheetAddressWidget> {
  bool radioButtonStatus = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          radioButtonStatus = !radioButtonStatus;
        });
      },
      child: Container(
        margin: const EdgeInsetsDirectional.symmetric(
          vertical: 10,
        ),
        padding: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          color: radioButtonStatus
              ? AppColors.white.withOpacity(.7)
              : AppColors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(
            AppSizes.borderRadius,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectedAddressRadioIcon(radioButtonStatus: radioButtonStatus),
            const AddressIcon(),
            const SizedBox(
              width: 5,
            ),
            const AddressItemNameAndDiscription(),
          ],
        ),
      ),
    );
  }
}
