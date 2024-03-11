import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_open_street_map/open_street_map.dart';
import 'package:market_app/core/Widgets/back_arrow_button.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/Widgets/my_main_button.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/address/customer_address/presentation/views/customer_address_details.dart';
import 'package:page_transition/page_transition.dart';

class CustomerAddNewAddressScreen extends StatelessWidget {
  const CustomerAddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Add Address',
      ),
      // body: Container(
      //   color: Colors.amber,
      // ),
      body: FlutterOpenStreetMap(
          center: LatLong(23, 89),
          onPicked: (pickedData) {
            print(pickedData.latLong.latitude);
            print(pickedData.latLong.longitude);
            print(pickedData.address);
          }),
      bottomNavigationBar: MyMainButton(
          margin: const EdgeInsetsDirectional.all(20),
          context: context,
          onTap: () {
            AppUtilities.navigateToNewPage(
              context: context,
              newPage: const CustomerNewAddressDetailsScreen(),
              pageTransitionType: PageTransitionType.rightToLeft,
            );
          },
          title: 'Continue'),
    );
  }
}
