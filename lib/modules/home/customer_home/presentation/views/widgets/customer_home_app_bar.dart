import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/basket_button.dart';
import 'package:market_app/core/Widgets/notifications_button.dart';
import 'package:market_app/core/Widgets/sign_in_button.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/address_button_widget.dart';

class CustomerHomeAppBar extends StatelessWidget {
  const CustomerHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Location Button widget
          if (token == null) const SignInButton(),
          if (token != null) const AddressButtonWidget(),
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
  }
}
