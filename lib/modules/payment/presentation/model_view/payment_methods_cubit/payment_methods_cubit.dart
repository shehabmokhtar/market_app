import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_app/core/functions/get_list_from_json.dart';
import 'package:market_app/modules/orders/data/models/payment_method_model.dart';
import 'package:market_app/modules/payment/data/repository/payment_repo_impl.dart';

part 'payment_methods_state.dart';

class PaymentMethodsCubit extends Cubit<PaymentMethodsStates> {
  PaymentMethodsCubit() : super(PaymentMethodsInitial());

  PaymentRepo paymentRepo = PaymentRepo();
  List<PaymentMethodModel> paymentMethods = [];

  Future<void> getPaymentMethods() async {
    emit(GetPaymentMethodsLoadingState());

    var result = await paymentRepo.getPayments();

    result.fold((ifLeft) {
      paymentMethods = getListFromJson(
          data: ifLeft.data, fromJson: (e) => PaymentMethodModel.fromJson(e));
      emit(GetPaymentMethodsSuccessState());
    }, (ifRight) => emit(GetPaymentMethodsErrorState(ifRight.errorMessage)));
  }
}
