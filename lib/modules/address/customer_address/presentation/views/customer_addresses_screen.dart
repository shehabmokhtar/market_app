import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/add_new_address_button.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/Widgets/loading_shape.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/addresses_bottom_sheet_content.dart';

class CustomerAddressesScreen extends StatelessWidget {
  CustomerAddressesScreen({super.key});
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressesCubit, AddressesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return RefreshIndicator(
          color: Colors.amber,
          onRefresh: () async {
            sl<AddressesCubit>().getCustomerAddresses();
          },
          child: LoadingShapeFullScreen(
            condition: state is GetAddressesLoadingState,
            child: Scaffold(
              appBar: customAppBar(context: context, title: 'Addresses'),
              body: sl<AddressesCubit>().customerAddresses.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        children: [
                          AddressesListItems(
                            isDeleteButton: true,
                          ),
                          const AddAddressButton(),
                        ],
                      ),
                    )
                  : state is! GetAddressesSuccessState
                      ? Container()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'There no addresses, Add a new address',
                              style: AppSizes.regularTextStyle(context),
                            ),
                            const AddAddressButton(),
                          ],
                        ),
            ),
          ),
        );
      },
    );
  }
}
