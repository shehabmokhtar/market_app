part of 'add_address_cubit.dart';

@immutable
sealed class AddAddressStates {}

final class CustomerAddressInitial extends AddAddressStates {}

// get countries loading state
final class GetCountriesLoadingState extends AddAddressStates {}

// get countries sucess state
final class GetCountriesSuccessState extends AddAddressStates {}

// get countries Error state
final class GetCountriesErrorState extends AddAddressStates {
  final ServerFailure serverFailure;
  GetCountriesErrorState(this.serverFailure);
}

// get cities in country loading state
final class GetCitiesInCountriesLoadingState extends AddAddressStates {}

// get cities in country sucess state
final class GetCitiesInCountriesSuccessState extends AddAddressStates {
  final List<CountryModel> citiesInCountry;
  GetCitiesInCountriesSuccessState(this.citiesInCountry);
}

// get cities in country Error state
final class GetCitiesInCountriesErrorState extends AddAddressStates {
  final ServerFailure serverFailure;
  GetCitiesInCountriesErrorState(this.serverFailure);
}

// get districts in city loading state
final class GetDistrictsInCityLoadingState extends AddAddressStates {}

// get districts in city sucess state
final class GetDistrictsInCitySuccessState extends AddAddressStates {
  final List<CountryModel> districtsInCity;
  GetDistrictsInCitySuccessState(this.districtsInCity);
}

// get districts in city Error state
final class GetDistrictsInCityErrorState extends AddAddressStates {
  final ServerFailure serverFailure;
  GetDistrictsInCityErrorState(this.serverFailure);
}

// get sub districts in districts loading state
final class GetSubDistrictsInDistrictsLoadingState extends AddAddressStates {}

// get sub districts in districts sucess state
final class GetSubDistrictsInDistrictsSuccessState extends AddAddressStates {
  final List<CountryModel> districtsInCity;
  GetSubDistrictsInDistrictsSuccessState(this.districtsInCity);
}

// get sub districts in districts Error state
final class GetSubDistrictsInDistrictsErrorState extends AddAddressStates {
  final ServerFailure serverFailure;
  GetSubDistrictsInDistrictsErrorState(this.serverFailure);
}
