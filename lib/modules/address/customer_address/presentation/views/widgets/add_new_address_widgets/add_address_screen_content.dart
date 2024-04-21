import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/my_main_button.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/address/customer_address/data/models/country_model.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/add_address_cubit/add_address_cubit.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/widgets/add_new_address_widgets/custom_drop_down_menu_with_title.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/widgets/add_new_address_widgets/custom_text_filed_with_title.dart';

class AddAddressScreenContent extends StatefulWidget {
  const AddAddressScreenContent({
    super.key,
  });

  @override
  State<AddAddressScreenContent> createState() =>
      _AddAddressScreenContentState();
}

class _AddAddressScreenContentState extends State<AddAddressScreenContent> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddAddressCubit, AddAddressStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  // 25 pixels on the top
                  const SizedBox(height: 25),
                  // Customer can choose country
                  if (sl<AddAddressCubit>().countries.isNotEmpty)
                    CustomDrowDownMenuWithTitle(
                        value: sl<AddAddressCubit>().countries[0].id,
                        title: 'Country',
                        dropDownMenuTitle: 'Countries',
                        items: fillDropDownMenuList(
                            sl<AddAddressCubit>().countries),
                        onChanged: (String value) {
                          // Assign country id to address model
                          sl<AddAddressCubit>().addressModel.countryId = value;
                          // get cities in country
                          sl<AddAddressCubit>()
                              .getCitiesInCountry(countryId: value);
                        }),
                  // Customer can see the all cities in the chose country
                  if (sl<AddAddressCubit>().citiesInCountry.isNotEmpty)
                    CustomDrowDownMenuWithTitle(
                      title: 'City',
                      dropDownMenuTitle: 'Cities',
                      items: fillDropDownMenuList(
                          sl<AddAddressCubit>().citiesInCountry),
                      onChanged: (String value) {
                        // Assign city id (value) to addrsses model
                        sl<AddAddressCubit>().addressModel.cityId = value;
                        // get districts in city
                        sl<AddAddressCubit>().getDistrictsInCity(cityId: value);
                      },
                      value: sl<AddAddressCubit>().citiesInCountry[0].id,
                    ),
                  // Customer can see the all districts in the chose city
                  if (sl<AddAddressCubit>().districtsInCity.isNotEmpty)
                    CustomDrowDownMenuWithTitle(
                      title: 'District',
                      dropDownMenuTitle: 'Districts',
                      items: fillDropDownMenuList(
                          sl<AddAddressCubit>().districtsInCity),
                      onChanged: (String value) {
                        // Assign district id (value) to addrsses model
                        sl<AddAddressCubit>().addressModel.districtId = value;
                        // get sub districts in districts
                        sl<AddAddressCubit>()
                            .getSubDistrictsInDistricts(districtsId: value);
                      },
                      value: sl<AddAddressCubit>().districtsInCity[0].id,
                    ),
                  // Customer can see the all sub districts in the chose districts
                  if (sl<AddAddressCubit>().subDistrictsIndistricts.isNotEmpty)
                    CustomDrowDownMenuWithTitle(
                      title: 'Sub District',
                      dropDownMenuTitle: 'Sub Districts',
                      items: fillDropDownMenuList(
                          sl<AddAddressCubit>().subDistrictsIndistricts),
                      onChanged: (String value) {
                        // Assign sub district id (value) to addrsses model
                        setState(() {
                          sl<AddAddressCubit>().addressModel.subDistrictId =
                              value;
                        });
                      },
                      value:
                          sl<AddAddressCubit>().subDistrictsIndistricts[0].id,
                    ),
                  // Street
                  //! if (sl<AddAddressCubit>().addressModel.subDistrictId != '')
                  // CustomTextFormFiled(
                  //   controller: sl<AddAddressCubit>().streetController,
                  //   prefixIcon: Icons.streetview,
                  //   hintText: 'Street',
                  // ),
                  // Apartment
                  if (sl<AddAddressCubit>().addressModel.subDistrictId != '')
                    CustomTextFormFiledWithTitle(
                      title: 'Apartment',
                      controller: sl<AddAddressCubit>().apartmentController,
                      prefixIcon: Icons.maps_home_work_outlined,
                      hintText: 'Apartment',
                    ),
                  // Floor
                  if (sl<AddAddressCubit>().addressModel.subDistrictId != '')
                    CustomTextFormFiledWithTitle(
                      title: 'Floor',
                      controller: sl<AddAddressCubit>().floorController,
                      prefixIcon: Icons.layers_outlined,
                      hintText: 'Floor',
                    ),
                  // FlatNumber
                  if (sl<AddAddressCubit>().addressModel.subDistrictId != '')
                    CustomTextFormFiledWithTitle(
                      title: 'Flat Number',
                      controller: sl<AddAddressCubit>().flatNumberController,
                      prefixIcon: Icons.home_max_sharp,
                      textInputType: TextInputType.number,
                      hintText: 'Flat Number',
                    ),
                  // Full address
                  if (sl<AddAddressCubit>().addressModel.subDistrictId != '')
                    CustomTextFormFiledWithTitle(
                      title: 'Full Address',
                      controller: sl<AddAddressCubit>().fullAddressController,
                      prefixIcon: Icons.home_work_outlined,
                      hintText: 'Full Address',
                    ),
                  // Additional Info
                  if (sl<AddAddressCubit>().addressModel.subDistrictId != '')
                    CustomTextFormFiledWithTitle(
                      title: 'Additonal Info',
                      controller:
                          sl<AddAddressCubit>().additionalInfoController,
                      prefixIcon: Icons.note_alt_outlined,
                      hintText: 'Additonal Info',
                    ),
                ],
              ),
            ),
          ),
          bottomNavigationBar:
              sl<AddAddressCubit>().addressModel.subDistrictId != ''
                  ? MyMainButton(
                      margin: const EdgeInsetsDirectional.all(20),
                      context: context,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          sl<AddAddressCubit>().addNewAddress();
                        }
                      },
                      title: 'Add Address')
                  : const Text(''),
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
