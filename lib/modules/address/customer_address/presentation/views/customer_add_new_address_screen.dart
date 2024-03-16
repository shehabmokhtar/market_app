import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/Widgets/loading_container.dart';
import 'package:market_app/core/Widgets/my_main_button.dart';
import 'package:market_app/core/functions/animated_dialog_method.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/add_address_cubit/add_address_cubit.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/widgets/add_new_address_widgets/add_address_screen_content.dart';

class CustomerAddNewAddressScreen extends StatelessWidget {
  const CustomerAddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    serviceLocator<AddAddressCubit>().getCountries();
    return BlocConsumer<AddAddressCubit, AddAddressStates>(
      listener: (context, state) {
        addAddressErrorStates(context, state);
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              // Screen app bar
              appBar: customAppBar(context: context, title: 'Add Address'),
              // Screen body content
              body: const AddAddressScreenContent(),
              // Add a new address button
              bottomNavigationBar: MyMainButton(
                  margin: const EdgeInsetsDirectional.all(20),
                  context: context,
                  onTap: () {},
                  title: 'Continue'),
            ),
            if (addAddressLoadingStates(context, state))
              const LoadingContainer(),
          ],
        );
      },
    );
  }

  void addAddressErrorStates(context, state) {
    if (state is GetCountriesErrorState ||
        state is GetCitiesInCountriesErrorState ||
        state is GetDistrictsInCityErrorState ||
        state is GetSubDistrictsInDistrictsErrorState) {
      customAwesomeDialog(
        context: context,
        titleMessage: '',
        descMessage: state.serverFailure.errorMessage,
      ).show();
    }
  }

  bool addAddressLoadingStates(context, state) {
    if (state is GetCountriesLoadingState ||
        state is GetCitiesInCountriesLoadingState ||
        state is GetDistrictsInCityLoadingState ||
        state is GetSubDistrictsInDistrictsLoadingState) {
      return true;
    }
    return false;
  }
}
