import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/address/customer_address/data/models/customer_address_model.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/customer_addresses_screen.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/address_item.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/location_pin_icon.dart';
import 'package:market_app/modules/orders/presentation/views/widgets/order_section_details.dart';
import 'package:page_transition/page_transition.dart';

class CustomerOrderScreen extends StatefulWidget {
  const CustomerOrderScreen({super.key});

  @override
  State<CustomerOrderScreen> createState() => _CustomerOrderScreenState();
}

class _CustomerOrderScreenState extends State<CustomerOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'Order'),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        child: ListView(
          children: [
            // Address section
            OrderSectionDetails(
              sectionTitle: 'Address',
              sectionBody: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LocationPinIcon(),
                  const SizedBox(width: 2),
                  Text(
                    'Home, ',
                    style: AppSizes.smallTextStyle(context).copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: Text(
                      formatAddress(_getCurrentAddressModel()),
                      style: AppSizes.smallTextStyle(context),
                    ),
                  ),
                ],
              ),
              onTap: () {
                AppUtilities.navigateToNewPage(
                  context: context,
                  newPage: CustomerAddressesScreen(),
                  pageTransitionType: PageTransitionType.rightToLeft,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  CustomerAddressModel _getCurrentAddressModel() {
    return sl<AddressesCubit>().customerAddresses[currentAddressIndex ?? 0];
  }
}
