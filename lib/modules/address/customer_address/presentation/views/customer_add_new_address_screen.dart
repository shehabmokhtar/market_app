import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/Widgets/my_main_button.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/customer_address_details.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/widgets/add_address_screen_content.dart';
import 'package:page_transition/page_transition.dart';

class CustomerAddNewAddressScreen extends StatelessWidget {
  const CustomerAddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Screen app bar
      appBar: customAppBar(context: context, title: 'Add Address'),
      // Screen body content
      body: AddAddressScreenContent(),
      // Add a new address button
      bottomNavigationBar: MyMainButton(
          margin: const EdgeInsetsDirectional.all(20),
          context: context,
          onTap: () {
            AppUtilities.navigateToNewPage(
                context: context,
                newPage: const CustomerNewAddressDetailsScreen(),
                pageTransitionType: PageTransitionType.rightToLeft);
          },
          title: 'Continue'),
    );
  }
}
