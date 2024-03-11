import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_app/core/Widgets/back_arrow_button.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:open_location_picker/open_location_picker.dart';

class CustomerAddNewAddressScreen extends StatelessWidget {
  const CustomerAddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          context: context,
          title: 'Add Address',
        ),
        // body: Column(
        //   children: [
        //     SizedBox(
        //       height: 400,
        //       child: FlutterOpenStreetMap(
        //         center: LatLong(41.0082, 28.9784),
        //         onPicked: (pickedData) {
        //           print(pickedData.latLong.latitude);
        //           print(pickedData.latLong.longitude);
        //           print(pickedData.addressName);
        //           print(pickedData.address.isEmpty);
        //         },
        //         locationIconColor: AppColors.primaryColor,
        //       ),
        //     ),
        //   ],
        body: ListView(
          children: [
            OpenMapPicker(
              decoration: const InputDecoration(hintText: "My location"),
              onSaved: (FormattedLocation? newValue) {
                print('>>>>> ${newValue!.address.country}');
                print('>>>>> ${newValue.address.city}');

                /// save new value
              },
            ),
          ],
        ));
  }
}
