import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/Widgets/loading_container.dart';
import 'package:market_app/core/Widgets/my_main_button.dart';
import 'package:market_app/core/functions/custom_awesome_dialog.dart';
import 'package:market_app/core/functions/get_location.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/add_address_cubit/add_address_cubit.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/widgets/add_new_address_widgets/add_address_screen_content.dart';

class CustomerAddNewAddressScreen extends StatelessWidget {
  const CustomerAddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(userCurrentLocation == null);
    print(userCurrentLocation!.latitude);
    print(userCurrentLocation!.longitude);
    sl<AddAddressCubit>().makeAddressesNull();
    sl<AddAddressCubit>().getCountries();
    return BlocConsumer<AddAddressCubit, AddAddressStates>(
      listener: (context, state) {
        if (state is AddNewAddressSuccessState) {
          customAwesomeDialog(
            context: context,
            titleMessage: '',
            descMessage: 'New Address Added Successfully',
            dialogType: DialogType.success,
            btnOkonPress: () {
              Navigator.pop(context);
            },
          ).show();
          sl<AddressesCubit>().getCustomerAddresses();
          // sl<AddressesCubit>().getCustomerAddresses();
        }
        addAddressErrorStates(context, state);
      },
      builder: (context, state) {
        if (userCurrentLocation == null) {
          return const Scaffold(body: Text('sdfsd'));
        } else {
          return Stack(
            children: [
              Scaffold(
                // Screen app bar
                appBar: customAppBar(context: context, title: 'Add Address'),
                // Screen body content
                body: const AddAddressScreenContent(),
              ),
              if (addAddressLoadingStates(context, state))
                const LoadingContainer(),
            ],
          );
        }
      },
    );
  }

// Todo Todo Todo Todo
  showDialogThroughStates(state, List statesList, DialogType dialogType) {
    for (dynamic s in statesList) {
      if (state == s) {
        //Todo
      }
    }
  }

  void addAddressErrorStates(context, state) {
    if (state is GetCountriesErrorState ||
        state is GetCitiesInCountriesErrorState ||
        state is GetDistrictsInCityErrorState ||
        state is GetSubDistrictsInDistrictsErrorState ||
        state is AddNewAddressErrorState) {
      customAwesomeDialog(
        context: context,
        titleMessage: '',
        descMessage: state.serverFailure.errorMessage,
        dialogType: DialogType.error,
        btnOkonPress: () {
          Navigator.pop(context);
        },
      ).show();
    }
  }

  bool addAddressLoadingStates(context, state) {
    if (state is GetCountriesLoadingState ||
        state is GetCitiesInCountriesLoadingState ||
        state is GetDistrictsInCityLoadingState ||
        state is GetSubDistrictsInDistrictsLoadingState ||
        state is AddNewAddressLoadingState) {
      return true;
    }
    return false;
  }
}
