part of 'addresses_cubit.dart';

@immutable
sealed class AddressesStates {}

final class AddressesCubitInitial extends AddressesStates {}

// get addresses loading state
final class GetAddressesLoadingState extends AddressesStates {}

// get addresses success state
final class GetAddressesSuccessState extends AddressesStates {}

// get addresses error state
final class GetAddressesErrorState extends AddressesStates {
  final String errorMessage;
  GetAddressesErrorState(this.errorMessage);
}

// delete address loading state
final class DeleteAddressLoadingState extends AddressesStates {}

// delete address success state
final class DeleteAddressSuccessState extends AddressesStates {
  final String successMessage;
  DeleteAddressSuccessState(this.successMessage);
}

// delete address error state
final class DeleteAddressErrorState extends AddressesStates {
  final String errorMessage;
  DeleteAddressErrorState(this.errorMessage);
}
