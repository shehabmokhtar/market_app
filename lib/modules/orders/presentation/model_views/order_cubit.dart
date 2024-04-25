import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/constants/app_languages.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/newwork/dio_helper.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/basket/presentation/model_view/customer_basket_cubit/basket_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/model_view/active_order/current_active_orders_cubit.dart';
import 'package:market_app/modules/orders/data/models/order_model.dart';
import 'package:market_app/modules/orders/data/models/order_status_model.dart';
import 'package:market_app/modules/orders/data/repos/order_repo.dart';
import 'package:market_app/modules/orders/presentation/model_views/order_states.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit(this._orderRepo) : super(OrderInitialState());
  final OrderRepo _orderRepo;

  bool isLoading = false;
  bool hasMore = true;
  int currentPage = 1;
  List<OrderModel> orders = [];

  Future<void> getOrders([bool shouldRerun = true]) async {
    if (isLoading || !hasMore) {
      return;
    }

    isLoading = true;
    if (shouldRerun) {
      emit(OrderLoadingState());
    }

    final result = await _orderRepo.getOrdersList('page=$currentPage');
    isLoading = false;

    result.fold(
      (l) => emit(OrderFailureState(l.message)),
      (r) {
        if (r!.isNotEmpty) {
          orders = List<OrderModel>.from(orders)..addAll(r);
          currentPage++;

          if (r.length < 10) {
            hasMore = false;
          }

          emit(OrderSuccessState(orders));
        } else {
          hasMore = false;
          emit(const OrderSuccessState([]));
        }
      },
    );
  }

  updateStatus(String orderId, OrderStatusModel orderStatusModel) {
    if (state is OrderSuccessState) {
      final updatedOrders = orders.map((order) {
        return order.id == orderId
            ? order.copyWith(orderStatusModel: orderStatusModel)
            : order;
      }).toList();

      orders = updatedOrders;
      emit(OrderSuccessState(updatedOrders));
    }
  }

  postOrder({
    required String paymentMethodId,
    required String basketId,
    required String addressId,
  }) async {
    emit(PostOrderLoadingState());

    try {
      // Post the data
      var result = await DioHelper.post(
        endPoint: Endpoints.order,
        token: token,
        lang: AppLanguages.currentLang,
        data: {
          "paymentMethodId": paymentMethodId,
          "basketId": basketId,
          "addressId": addressId
        },
      );

      if (result.statusCode == 201 || result.statusCode == 200) {
        sl<BasketCubit>().basketProducts.clear();
        CurrentActiveOrderCubit currentActiveOrderCubit =
            CurrentActiveOrderCubit(sl());
        currentActiveOrderCubit.getActiveOrders();
        emit(PostOrderSuccessState());
      } else {
        emit(const PostOrderErrorState('Error'));
      }
    } catch (e) {
      if (e is DioException) {
        final errorMessage = ServerFailure.fromDioError(e).errorMessage;
        print(errorMessage);
        emit(PostOrderErrorState(errorMessage));
      }
    }
  }
}
