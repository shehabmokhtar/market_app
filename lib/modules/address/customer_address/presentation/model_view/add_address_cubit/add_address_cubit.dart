import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:market_app/core/functions/get_list_from_json.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/address/customer_address/data/models/address_model.dart';
import 'package:market_app/modules/address/customer_address/data/models/country_model.dart';
import 'package:market_app/modules/address/customer_address/data/repository/add_address_repo/add_address_repo_imp.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:meta/meta.dart';
part 'add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressStates> {
  AddAddressCubit() : super(CustomerAddressInitial());

  // the model that will be make the request
  AddressModel addressModel = AddressModel(
    fullAddress: '',
    lat: 0,
    lng: 0,
    additionalInfo: '',
    apartment: '',
    floor: '',
    flatNumber: -111,
    countryId: '',
    cityId: '',
    districtId: '',
    subDistrictId: '',
  );

  //  fullAddress: '', //! text
  //   lat: 0,
  //   lng: 0,
  //   additionalInfo: '', //! text
  //   apartment: '',  //! text
  //   floor: '',   //! number
  //   flatNumber: -111, //! text
  //?   countryId: '',
  //?   cityId: '',
  //?   districtId: '',
  //?   subDistrictId: '',

  List<CountryModel> countries = [];
  List<CountryModel> citiesInCountry = [];
  List<CountryModel> districtsInCity = [];
  List<CountryModel> subDistrictsIndistricts = [];
  var streetController = TextEditingController();
  var fullAddressController = TextEditingController();
  var apartmentController = TextEditingController();
  var floorController = TextEditingController();
  var flatNumberController = TextEditingController();
  var additionalInfoController = TextEditingController();

// Get Countries
  Future<void> getCountries() async {
    emit(GetCountriesLoadingState());

    // the request response
    var result = await sl<AddAddressRepo>().getCountries();

    result.fold(
        // In the case of success
        (left) {
      countries = getListFromJson(
        data: left.data,
        fromJson: (e) => CountryModel.fromJson(e),
      );
      emit(GetCountriesSuccessState());
    },
        // In the case of failure
        (right) => emit(GetCountriesErrorState(right)));
  }

// Get cities in country
  Future<void> getCitiesInCountry({
    required String countryId,
  }) async {
    emit(GetCitiesInCountriesLoadingState());

    // the request response
    var result =
        await sl<AddAddressRepo>().getCitiesInCountry(countryId: countryId);

    result.fold(
        // In the case of success
        (left) {
      citiesInCountry = getListFromJson(
        data: left.data,
        fromJson: (e) => CountryModel.fromJson(e),
      );
      emit(GetCitiesInCountriesSuccessState());
    },
        // In the case of failure
        (right) => emit(GetCitiesInCountriesErrorState(right)));
  }

  // Get districts in city
  Future<void> getDistrictsInCity({
    required String cityId,
  }) async {
    emit(GetDistrictsInCityLoadingState());

    // the request response
    var result = await sl<AddAddressRepo>().getDistrictsInCity(cityId: cityId);

    result.fold(
        // In the case of success
        (left) {
      districtsInCity = getListFromJson(
        data: left.data,
        fromJson: (e) => CountryModel.fromJson(e),
      );
      emit(GetDistrictsInCitySuccessState());
    },
        // In the case of failure
        (right) => emit(GetDistrictsInCityErrorState(right)));
  }

  // Get sub districts in districts
  Future<void> getSubDistrictsInDistricts({
    required String districtsId,
  }) async {
    emit(GetSubDistrictsInDistrictsLoadingState());

    // the request response
    var result = await sl<AddAddressRepo>()
        .getSubDistrictsInDistricts(districtsId: districtsId);

    result.fold(
        // In the case of success
        (left) {
      subDistrictsIndistricts = getListFromJson(
        data: left.data,
        fromJson: (e) => CountryModel.fromJson(e),
      );
      emit(GetSubDistrictsInDistrictsSuccessState());
    },
        // In the case of failure
        (right) => emit(GetSubDistrictsInDistrictsErrorState(right)));
  }

  addNewAddress() async {
    emit(AddNewAddressLoadingState());

// fill the address model
    addressModel.apartment = apartmentController.text;
    addressModel.floor = floorController.text;
    addressModel.flatNumber = int.parse(flatNumberController.text);
    addressModel.fullAddress = fullAddressController.text;
    addressModel.additionalInfo = additionalInfoController.text;
    addressModel.lat = userCurrentLocation!.latitude;
    addressModel.lng = userCurrentLocation!.longitude;
    addressModel.display();
// the request response
    var result =
        await sl<AddAddressRepo>().addNewAddress(data: addressModel.toJson());

    result.fold(
        // In the case of success
        (left) {
      emit(AddNewAddressSuccessState(left.statusMessage!));
    },
        // In the case of failure
        (right) => emit(AddNewAddressErrorState(right)));
  }

  makeAddressesNull() {
    // delete addresses model
    addressModel = AddressModel(
      fullAddress: '',
      lat: 0,
      lng: 0,
      additionalInfo: '',
      apartment: '',
      floor: '',
      flatNumber: -111,
      countryId: '',
      cityId: '',
      districtId: '',
      subDistrictId: '',
    );

    // delete all lists
    countries.clear();
    citiesInCountry.clear();
    districtsInCity.clear();
    subDistrictsIndistricts.clear();

    // delete all controllers data
    streetController.clear();
    fullAddressController.clear();
    apartmentController.clear();
    floorController.clear();
    flatNumberController.clear();
    additionalInfoController.clear();
  }
}
