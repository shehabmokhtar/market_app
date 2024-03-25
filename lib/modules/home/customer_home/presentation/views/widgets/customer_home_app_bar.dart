import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/add_new_address_button.dart';
import 'package:market_app/core/Widgets/basket_button.dart';
import 'package:market_app/core/Widgets/notifications_button.dart';
import 'package:market_app/core/Widgets/sign_in_button.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/address_button_widget.dart';

class CustomerHomeAppBar extends StatelessWidget {
  const CustomerHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressesCubit, AddressesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // if the user does not sign in
              if (token == null) const SignInButton(),
              // if the user signed in and has address
              if (token != null &&
                  sl<AddressesCubit>().customerAddresses.isNotEmpty)
                const AddressButtonWidget(),
              // if the user signed in but does not have address
              if (token != null &&
                  sl<AddressesCubit>().customerAddresses.isEmpty)
                const AddAddressButton(),
              const SizedBox(
                width: 20,
              ),
              const Spacer(),
              // The basket/cart button
              const BasketButton(),
              // Notifcation screen button
              const NotificationsButton(),
            ],
          ),
        );
      },
    );
  }
}
