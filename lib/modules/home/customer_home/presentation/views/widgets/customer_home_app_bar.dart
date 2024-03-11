import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/basket_button.dart';
import 'package:market_app/core/Widgets/notifications_button.dart';
import 'package:market_app/core/Widgets/sign_in_button.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/sign_in_screen.dart';
import 'package:market_app/modules/authantication/presentation/views/sing_up/sign_up_screen.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/address_button_widget.dart';

class CustomerHomeAppBar extends StatelessWidget {
  const CustomerHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}
