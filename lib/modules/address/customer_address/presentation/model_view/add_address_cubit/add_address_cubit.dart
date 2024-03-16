import 'package:bloc/bloc.dart';
import 'package:market_app/core/functions/get_list_from_json.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/address/customer_address/data/models/address_model.dart';
import 'package:market_app/modules/address/customer_address/data/models/country_model.dart';
import 'package:market_app/modules/address/customer_address/data/repository/add_address_repo/add_address_repo_imp.dart';
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

  List<CountryModel> countries = [];
  List<CountryModel> citiesInCountry = [];

// Get Countries
  Future<void> getCountry() async {
    emit(GetCountriesLoadingState());

    // the request response
    var result = await serviceLocator<AddAddressRepo>().getCountries();

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
    var result = await serviceLocator<AddAddressRepo>()
        .getCitiesInCountry(countryId: countryId);

    result.fold(
        // In the case of success
        (left) => emit(GetCitiesInCountriesSuccessState(
              getListFromJson(
                data: left.data,
                fromJson: (e) => CountryModel.fromJson(e),
              ),
            )),
        // In the case of failure
        (right) => emit(GetCitiesInCountriesErrorState(right)));
  }

  // Get districts in city
  Future<void> getDistrictsInCity({
    required String cityId,
  }) async {
    emit(GetDistrictsInCityLoadingState());

    // the request response
    var result = await serviceLocator<AddAddressRepo>()
        .getDistrictsInCity(cityId: cityId);

    result.fold(
        // In the case of success
        (left) => emit(GetDistrictsInCitySuccessState(
              getListFromJson(
                data: left.data,
                fromJson: (e) => CountryModel.fromJson(e),
              ),
            )),
        // In the case of failure
        (right) => emit(GetDistrictsInCityErrorState(right)));
  }

  // Get sub districts in districts
  Future<void> getSubDistrictsInDistricts({
    required String districtsId,
  }) async {
    emit(GetSubDistrictsInDistrictsLoadingState());

    // the request response
    var result = await serviceLocator<AddAddressRepo>()
        .getSubDistrictsInDistricts(districtsId: districtsId);

    result.fold(
        // In the case of success
        (left) => emit(GetSubDistrictsInDistrictsSuccessState(
              getListFromJson(
                data: left.data,
                fromJson: (e) => CountryModel.fromJson(e),
              ),
            )),
        // In the case of failure
        (right) => emit(GetSubDistrictsInDistrictsErrorState(right)));
  }
}
