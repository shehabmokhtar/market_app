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
final class GetCitiesInCountriesSuccessState extends AddAddressStates {}

// get cities in country Error state
final class GetCitiesInCountriesErrorState extends AddAddressStates {
  final ServerFailure serverFailure;
  GetCitiesInCountriesErrorState(this.serverFailure);
}

// get districts in city loading state
final class GetDistrictsInCityLoadingState extends AddAddressStates {}

// get districts in city sucess state
final class GetDistrictsInCitySuccessState extends AddAddressStates {}

// get districts in city Error state
final class GetDistrictsInCityErrorState extends AddAddressStates {
  final ServerFailure serverFailure;
  GetDistrictsInCityErrorState(this.serverFailure);
}

// get sub districts in districts loading state
final class GetSubDistrictsInDistrictsLoadingState extends AddAddressStates {}

// get sub districts in districts sucess state
final class GetSubDistrictsInDistrictsSuccessState extends AddAddressStates {}

// get sub districts in districts Error state
final class GetSubDistrictsInDistrictsErrorState extends AddAddressStates {
  final ServerFailure serverFailure;
  GetSubDistrictsInDistrictsErrorState(this.serverFailure);
}

// add new address loading state
final class AddNewAddressLoadingState extends AddAddressStates {}

// add new address success state
final class AddNewAddressSuccessState extends AddAddressStates {
  final String successMessage;
  AddNewAddressSuccessState(this.successMessage);
}

// add new address error state
final class AddNewAddressErrorState extends AddAddressStates {
  final ServerFailure serverFailure;
  AddNewAddressErrorState(this.serverFailure);
}
