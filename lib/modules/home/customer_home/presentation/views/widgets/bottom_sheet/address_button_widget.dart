import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/button_sheet_widget.dart';
import 'package:market_app/core/constants/variables.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/addresses_bottom_sheet_widget.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/arrow_down_icon.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/location_text_and_address.dart';

class AddressButtonWidget extends StatelessWidget {
  const AddressButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressesCubit, AddressesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            // Show Addresses and edit it.
            showModalBottomSheet(
              context: AppVariables.layoutContext!,
              builder: (context) => const BottomSheetWidget(
                child: AdressesBottomSheetWidget(),
              ),
            );
          },
          child: SizedBox(
            width: AppSizes.screenWidth(context) / 1.6,
            child: const Row(
              children: [
                LocationTextAndAddress(),
                ArrowDownIcon(),
              ],
            ),
          ),
        );
      },
    );
  }
}
