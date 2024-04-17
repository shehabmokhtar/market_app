import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/conditional_builder.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/Widgets/divider_continer.dart';
import 'package:market_app/core/Widgets/sign_in_button.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/customer_addresses_screen.dart';
import 'package:market_app/modules/orders/presentation/views/orders_screen.dart';
import 'package:market_app/modules/profile/customer_profile/presentation/model_view/cubit/user_cubit.dart';
import 'package:market_app/modules/profile/customer_profile/presentation/views/widgets/items_collection.dart';
import 'package:market_app/modules/profile/customer_profile/presentation/views/widgets/profile_item.dart';
import 'package:page_transition/page_transition.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Profile app bar
      appBar: customAppBar(
        context: context,
        title: 'Profile',
        disableBackArrow: true,
        // titleColor: AppColors.black,
        // isBackgroundColorWhite: true,
      ),
      body: ConditionalBuilder(
        condition: token != null,
        isFalse: const Center(child: SignInButton()),
        isTrue: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              // the user information
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  BlocConsumer<UserCubit, UserStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return ItemsCollection(
                        collectionTitle: 'My Info',
                        collectionItems: [
                          //Todo: user info
                          ProfileItem(
                            title: sl<UserCubit>().userModel!.fullName!,
                            icon: Icons.person_2_outlined,
                            onTap: () {},
                          ),
                          //Todo: user info
                          ProfileItem(
                            title: sl<UserCubit>().userModel!.email!,
                            icon: Icons.email_outlined,
                            onTap: () {},
                          ),
                          //Todo: user info
                          ProfileItem(
                            title: sl<UserCubit>().userModel!.phoneNumber!,
                            icon: Icons.phone_outlined,
                            onTap: () {},
                          ),
                        ],
                      );
                    },
                  ),
                  const EditButton(),
                ],
              ),
              const SizedBox(height: 15),
              // the user settings
              ItemsCollection(
                collectionTitle: 'Settings',
                collectionItems: [
                  //Todo Customer Addresses
                  ProfileItem(
                    isButton: true,
                    title: 'Addresses',
                    icon: Icons.place_outlined,
                    onTap: () {
                      AppUtilities.navigateToNewPage(
                        context: context,
                        newPage: CustomerAddressesScreen(),
                        pageTransitionType: PageTransitionType.rightToLeft,
                      );
                    },
                  ),
                  const DividerContiner(),
                  //Todo payment methods
                  ProfileItem(
                    isButton: true,
                    title: 'Payment Methods',
                    icon: Icons.wallet_outlined,
                    onTap: () {},
                  ),
                  const DividerContiner(),
                  //Todo orders history
                  ProfileItem(
                    isButton: true,
                    title: 'Orders History',
                    icon: Icons.shopping_basket_outlined,
                    onTap: () {
                      Navigator.of(context).pushNamed(OrdersScreen.routeName);
                    },
                  ),
                  const DividerContiner(),
                  //Todo languages
                  ProfileItem(
                    isButton: true,
                    title: 'Languages',
                    icon: Icons.language_outlined,
                    onTap: () {},
                  ),
                  const DividerContiner(),
                  //Todo help
                  ProfileItem(
                    isButton: true,
                    title: 'Help',
                    icon: Icons.help_outline_rounded,
                    onTap: () {},
                  ),
                  const DividerContiner(),
                  //Todo Signin as a driver
                  Container(
                    color: AppColors.primaryColor.withOpacity(.3),
                    child: ProfileItem(
                      isButton: true,
                      title: 'Sign In As A Driver',
                      icon: Icons.motorcycle_outlined,
                      onTap: () {},
                    ),
                  ),
                  const DividerContiner(),
                  //Todo Sign out
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(.05),
                        borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(AppSizes.borderRadius),
                          bottomStart: Radius.circular(AppSizes.borderRadius),
                        )),
                    child: ProfileItem(
                      isButton: true,
                      title: 'Sign Out',
                      icon: Icons.logout_outlined,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(AppSizes.borderRadius),
                bottomEnd: Radius.circular(AppSizes.borderRadius),
              )),
          child: Text(
            'Edit',
            style: AppSizes.smallTextStyle(context)
                .copyWith(color: AppColors.white),
          )),
    );
  }
}
