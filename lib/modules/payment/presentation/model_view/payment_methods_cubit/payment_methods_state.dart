part of 'payment_methods_cubit.dart';

sealed class PaymentMethodsStates extends Equatable {
  const PaymentMethodsStates();

  @override
  List<Object> get props => [];
}

final class PaymentMethodsInitial extends PaymentMethodsStates {}

final class GetPaymentMethodsLoadingState extends PaymentMethodsStates {}

final class GetPaymentMethodsSuccessState extends PaymentMethodsStates {}

final class GetPaymentMethodsErrorState extends PaymentMethodsStates {
  final String errorMessage;
  const GetPaymentMethodsErrorState(this.errorMessage);
}
