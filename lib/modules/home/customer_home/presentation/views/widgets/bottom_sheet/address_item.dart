import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/functions/custom_awesome_dialog.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/address/customer_address/data/models/customer_address_model.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/address_icon.dart';

// ignore: must_be_immutable
class AddressItem extends StatefulWidget {
  AddressItem({
    super.key,
    required this.addressModel,
    this.isDeleteButton = false,
  });
  final CustomerAddressModel addressModel;
  bool isDeleteButton;

  @override
  State<AddressItem> createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressesCubit, AddressesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        String currentAddressId = sl<AddressesCubit>().currentAddressId!;
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                if (sl<AddressesCubit>().currentAddressId !=
                    widget.addressModel.id) {
                  sl<AddressesCubit>()
                      .changeCurrentAddress(widget.addressModel);
                }
              },
              child: Container(
                margin: const EdgeInsetsDirectional.symmetric(
                  vertical: 10,
                ),
                padding: const EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  color: currentAddressId == widget.addressModel.id
                      ? AppColors.white.withOpacity(.7)
                      : AppColors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppSizes.borderRadius,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Center(
                        child: Icon(
                          currentAddressId == widget.addressModel.id
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off_outlined,
                        ),
                      ),
                    ),
                    const AddressIcon(),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            //Todo: Add address name to addresses
                            'Home',
                            style: AppSizes.regularTextStyle(context)
                                .copyWith(color: AppColors.primaryColor),
                          ),
                          Text(
                            formatAddress(widget.addressModel),
                            style: AppSizes.smallTextStyle(context).copyWith(
                              color: AppColors.black.withOpacity(.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.isDeleteButton)
                      BlocConsumer<AddressesCubit, AddressesStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Column(
                            children: [
                              // Edit address button
                              IconButton(
                                onPressed: () {
                                  // if (state is DeleteAddressSuccessState) {
                                  //   sl<AddressesCubit>().getCustomerAddresses();
                                  // }
                                },
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  color: Colors.amber,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  customAwesomeDialog(
                                      dialogType: DialogType.warning,
                                      context: context,
                                      titleMessage: 'Warning',
                                      descMessage:
                                          'Do you want to delete this address',
                                      btnOkText: 'Yes',
                                      btnCancelOnPress: () {
                                        // Navigator.pop(context);
                                      },
                                      btnOkonPress: () {
                                        sl<AddressesCubit>().deleteAddress(
                                            widget.addressModel.id!);
                                      }).show();
                                },
                                // Delete Address Button
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: AppColors.errorColor,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String formatAddress(CustomerAddressModel model) {
    //Todo: Add street to addresses
    //! !//
    //Todo: Change data language based on user language
    return '${model.country!.enName}, ${model.city!.enName}, ${model.district!.enName}, ${model.subDistrict!.enName}, st: , apar: ${model.apartment}, floor: ${model.floor}, flatNum: ${model.flatNumber}';
  }
}
