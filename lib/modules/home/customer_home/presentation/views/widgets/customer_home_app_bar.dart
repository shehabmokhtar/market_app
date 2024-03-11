import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/basket_button.dart';
import 'package:market_app/core/Widgets/notifications_button.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/address_button_widget.dart';

class CustomerHomeAppBar extends StatelessWidget {
  const CustomerHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Location Button widget
          // if (token == null) const SignInButton(),
          // if (token != null)
          AddressButtonWidget(),
          SizedBox(
            width: 20,
          ),
          Spacer(),
          // The basket/cart button
          BasketButton(),
          // Notifcation screen button
          NotificationsButton(),
        ],
      ),
    );
  }
}
