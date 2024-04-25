import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/conditional_builder.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/Widgets/loading_circle.dart';
import 'package:market_app/core/Widgets/my_main_button.dart';
import 'package:market_app/core/functions/custom_awesome_dialog.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/address/customer_address/data/models/customer_address_model.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/customer_addresses_screen.dart';
import 'package:market_app/modules/basket/presentation/model_view/customer_basket_cubit/basket_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/address_item.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/location_pin_icon.dart';
import 'package:market_app/modules/orders/presentation/model_views/order_cubit.dart';
import 'package:market_app/modules/orders/presentation/model_views/order_states.dart';
import 'package:market_app/modules/orders/presentation/views/widgets/order_product_item_widget.dart';
import 'package:market_app/modules/orders/presentation/views/widgets/order_section_details.dart';
import 'package:market_app/modules/orders/presentation/views/widgets/title_and_price_row_widget.dart';
import 'package:market_app/modules/payment/presentation/model_view/payment_methods_cubit/payment_methods_cubit.dart';
import 'package:page_transition/page_transition.dart';

class CustomerOrderScreen extends StatefulWidget {
  const CustomerOrderScreen({super.key, required this.basketScreenContext});
  final BuildContext basketScreenContext;

  @override
  State<CustomerOrderScreen> createState() => _CustomerOrderScreenState();
}

class _CustomerOrderScreenState extends State<CustomerOrderScreen> {
  final int _totalPrice = sl<BasketCubit>().basketModel!.totalPrice!;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    // Get payment methods
    sl<PaymentMethodsCubit>().getPaymentMethods();
    List<Widget> basketProductsWidgets = List.generate(
      sl<BasketCubit>().basketProducts.length,
      (index) => OrderProductItemWidget(
          basketProductModel: sl<BasketCubit>().basketProducts[index]),
    );

    CustomerAddressModel customerAddressModel = _getCurrentAddressModel();

    return BlocConsumer<PaymentMethodsCubit, PaymentMethodsStates>(
      listener: (cc, state) {
        if (state is GetPaymentMethodsLoadingState) {
          setState(() {
            _isLoading = true;
          });
        }
        if (state is GetPaymentMethodsSuccessState) {
          _isLoading = false;
        }
        if (state is GetPaymentMethodsErrorState) {
          _isLoading = false;

          Navigator.pop(context);
          customAwesomeDialog(
                  dialogType: DialogType.error,
                  context: widget.basketScreenContext,
                  titleMessage: 'Error',
                  descMessage: state.errorMessage,
                  btnOkonPress: () {})
              .show();
        }
      },
      builder: (cc, state) {
        return ConditionalBuilder(
          condition: !_isLoading || basketProductsWidgets.isNotEmpty,
          isFalse: LoadingCircle(),
          isTrue: Scaffold(
            appBar: customAppBar(context: context, title: 'Order'),
            body: BlocConsumer<PaymentMethodsCubit, PaymentMethodsStates>(
                listener: (ctx, state) {},
                builder: (ctx, state) {
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 10),
                    child: ListView(
                      children: [
                        // Address section
                        OrderSectionDetails(
                          sectionTitle: 'Address',
                          sectionBody: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const LocationPinIcon(),
                              const SizedBox(width: 2),
                              Text(
                                'Home, ',
                                style:
                                    AppSizes.smallTextStyle(context).copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 2),
                              Expanded(
                                child: Text(
                                  formatAddress(customerAddressModel),
                                  style: AppSizes.smallTextStyle(context),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            AppUtilities.navigateToNewPage(
                              context: context,
                              newPage: CustomerAddressesScreen(),
                              pageTransitionType:
                                  PageTransitionType.rightToLeft,
                            );
                          },
                        ),
                        // Payment Section
                        if (sl<PaymentMethodsCubit>().paymentMethods.isNotEmpty)
                          OrderSectionDetails(
                              sectionTitle: 'Payment',
                              sectionBody: Text(
                                sl<PaymentMethodsCubit>()
                                    .paymentMethods[0]
                                    .enName!,
                                style: AppSizes.smallTextStyle(context),
                              )),
                        // Products
                        if (basketProductsWidgets.isNotEmpty)
                          OrderSectionDetails(
                            sectionTitle: 'Products',
                            sectionBody: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    basketProductsWidgets[index],
                                separatorBuilder: (context, index) =>
                                    const SizedBox(),
                                itemCount: basketProductsWidgets.length),
                          ),

                        // Payment Summary

                        OrderSectionDetails(
                            sectionTitle: 'Payment Summary',
                            sectionBody: Column(
                              children: [
                                TitleAndPriceRowWidget(
                                    title: 'Products price',
                                    price: '$_totalPrice TL'),
                                TitleAndPriceRowWidget(
                                    title: 'Delevery fee',
                                    price: '${branchInfo!.deliveryFees} TL'),
                                TitleAndPriceRowWidget(
                                    isPriceGreenColor: true,
                                    title: 'Discount',
                                    price: '0 TL'),
                                TitleAndPriceRowWidget(
                                    isPriceGreenColor: true,
                                    title: 'You saved',
                                    price: '0 TL 🥳'),
                                const Divider(),
                                TitleAndPriceRowWidget(
                                    title: 'Total price',
                                    price: '${_getTotalPrice()} TL'),
                              ],
                            )),
                      ],
                    ),
                  );
                }),
            bottomNavigationBar: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: BlocConsumer<OrderCubit, OrderStates>(
                listener: (c, state) {
                  if (state is PostOrderLoadingState) {
                    _isLoading = true;
                  }
                  if (state is PostOrderSuccessState) {
                    _isLoading = false;
                    customAwesomeDialog(
                        dialogType: DialogType.success,
                        context: context,
                        titleMessage: 'Success',
                        descMessage: 'Order Added Successfully',
                        btnOkonPress: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }).show();
                    setState(() {});
                  }
                  if (state is PostOrderErrorState) {
                    print(state.errorMessage);
                    isLoading = false;
                    customAwesomeDialog(
                            dialogType: DialogType.error,
                            context: context,
                            titleMessage: 'Error',
                            descMessage: state.errorMessage,
                            btnOkonPress: () {})
                        .show();
                  }
                },
                builder: (context, state) {
                  return MyMainButton(
                    context: context,
                    onTap: () {
                      _isLoading = true;
                      setState(() {});
                      OrderCubit orderCubit = OrderCubit(sl());
                      orderCubit.postOrder(
                        paymentMethodId:
                            sl<PaymentMethodsCubit>().paymentMethods[0].id,
                        basketId: sl<BasketCubit>().basketModel!.id!,
                        addressId: customerAddressModel.id!,
                      );
                    },
                    title: 'Order Now',
                  );
                },
              ),
            )),
          ),
        );
      },
    );
  }

  double _getTotalPrice() {
    return _totalPrice.toDouble() + branchInfo!.deliveryFees!.toDouble();
  }

  CustomerAddressModel _getCurrentAddressModel() {
    return sl<AddressesCubit>().customerAddresses[currentAddressIndex ?? 0];
  }
}
