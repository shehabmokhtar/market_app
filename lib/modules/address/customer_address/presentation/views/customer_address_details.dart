import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';

class CustomerNewAddressDetailsScreen extends StatelessWidget {
  const CustomerNewAddressDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'Address details'),
    );
  }
}
