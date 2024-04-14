import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/constants/variables.dart';
import 'package:market_app/core/functions/get_location.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/add_address_cubit/add_address_cubit.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/authantication/data/repository/authantication.dart';
import 'package:market_app/modules/authantication/data/repository/authantication_repo.dart';
import 'package:market_app/modules/layout/customer_layout/presentation/views/widgets/customer_navbar.dart';
import 'package:market_app/modules/layout/customer_layout/presentation/views/widgets/layout_screens.dart';

class CustomerLayout extends StatefulWidget {
  const CustomerLayout({super.key});

  @override
  State<CustomerLayout> createState() => _CustomerLayoutState();
}

class _CustomerLayoutState extends State<CustomerLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppVariables.layoutContext = context;
    return BlocConsumer<AddressesCubit, AddressesStates>(
      listener: (context, state) {
        if (state is DeleteAddressSuccessState ||
            state is AddNewAddressSuccessState) {
          sl<AddressesCubit>().getCustomerAddresses();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: customerLayoutScreens[currentIndex],
          bottomNavigationBar: CustomerNavBar(
            currentIndex: currentIndex,
            onTap: (value) async {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        );
      },
    );
  }
}
