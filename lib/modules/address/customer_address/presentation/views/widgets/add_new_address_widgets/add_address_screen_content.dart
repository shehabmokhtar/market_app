import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/address/customer_address/data/models/country_model.dart';
import 'package:market_app/modules/address/customer_address/data/repository/add_address_repo/add_address_repo_imp.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/add_address_cubit/add_address_cubit.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/widgets/add_new_address_widgets/custom_drop_down_menu_with_title.dart';

class AddAddressScreenContent extends StatelessWidget {
  const AddAddressScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    serviceLocator<AddAddressCubit>().countries.clear();
    serviceLocator<AddAddressCubit>().citiesInCountry.clear();
    if (serviceLocator<AddAddressCubit>().countries.isEmpty) {
      print('>>>>>>>>> ${serviceLocator<AddAddressCubit>().countries.length}');
    }
    return BlocConsumer<AddAddressCubit, AddAddressStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
          child: ListView(
            children: [
              // 25 pixels on the top
              const SizedBox(height: 25),
              // Customer can choose country
              if (serviceLocator<AddAddressCubit>().countries.isNotEmpty)
                CustomDrowDownMenuWithTitle(
                    value: serviceLocator<AddAddressCubit>().countries[0].id,
                    title: 'Country',
                    dropDownMenuTitle: 'Countries',
                    items: fillDropDownMenuList(
                        serviceLocator<AddAddressCubit>().countries),
                    onChanged: (String value) {
                      // Assign country id to address model
                      serviceLocator<AddAddressCubit>().addressModel.countryId =
                          value;
                      // get cities in country
                      serviceLocator<AddAddressCubit>()
                          .getCitiesInCountry(countryId: value);
                    }),
              if (serviceLocator<AddAddressCubit>().citiesInCountry.isNotEmpty)
                CustomDrowDownMenuWithTitle(
                  title: 'City',
                  dropDownMenuTitle: 'Cities',
                  items: fillDropDownMenuList(
                      serviceLocator<AddAddressCubit>().citiesInCountry),
                  onChanged: (value) {},
                  value:
                      serviceLocator<AddAddressCubit>().citiesInCountry[0].id,
                ),
            ],
          ),
        );
      },
    );
  }

  List<DropdownMenuItem<String>> fillDropDownMenuList(List<CountryModel> list) {
    return List.generate(
        list.length,
        (index) => DropdownMenuItem(
            value: list[index].id.toString(),
            //Todo: Change language
            child: Text(list[index].enName!.toString())));
  }
}
