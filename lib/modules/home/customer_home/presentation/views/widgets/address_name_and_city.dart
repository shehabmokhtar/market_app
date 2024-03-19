import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/address/customer_address/data/models/customer_address_model.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/address_name_widget.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/location_pin_icon.dart';

class AddressNameAndCity extends StatelessWidget {
  const AddressNameAndCity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressesCubit, AddressesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        CustomerAddressModel currentAddressModel =
            sl<AddressesCubit>().customerAddresses[0];
        return Row(
          children: [
            const LocationPinIcon(),
            const SizedBox(
              width: 1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Home, ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppSizes.regularTextStyle(context).copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  //Todo: change language
                  '${currentAddressModel.city!.enName!}, ${currentAddressModel.district!.enName!}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppSizes.smallTextStyle(context).copyWith(
                    color: AppColors.black.withOpacity(.6),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
