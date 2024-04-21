import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/add_new_address_button.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/addresses_bottom_sheet_content.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/addresses_bottom_sheet_top_bar.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/bottom_sheet_line_widget.dart';

class AdressesBottomSheetWidget extends StatelessWidget {
  const AdressesBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressesCubit, AddressesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
              // Addresses with add new address button
              Expanded(
                child: ListView(
                  children: [
                    // The bottom sheet content
                    AddressesListItems(),
                    // Add address button
                    const AddAddressButton(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
