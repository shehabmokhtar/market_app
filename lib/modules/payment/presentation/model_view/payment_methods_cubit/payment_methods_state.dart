part of 'payment_methods_cubit.dart';

sealed class PaymentMethodsState extends Equatable {
  const PaymentMethodsState();

  @override
  List<Object> get props => [];
}

final class PaymentMethodsInitial extends PaymentMethodsState {}
