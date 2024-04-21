import 'package:flutter/material.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/address/customer_address/data/models/customer_address_model.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/address_item.dart';

// ignore: must_be_immutable
class AddressesListItems extends StatelessWidget {
  AddressesListItems({
    super.key,
    this.isDeleteButton = false,
  });
  bool isDeleteButton;

  @override
  Widget build(BuildContext context) {
    List<CustomerAddressModel> addresses =
        sl<AddressesCubit>().customerAddresses;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(
          addresses.length,
          (index) => AddressItem(
                addressModel: addresses[index],
                isDeleteButton: isDeleteButton,
              )),
    );
  }
}
