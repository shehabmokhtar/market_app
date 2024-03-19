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
