import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';

class AllCategoriesAndSubCategoriesAndProductScreen extends StatelessWidget {
  const AllCategoriesAndSubCategoriesAndProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'All Categories'),
      body: const Center(child: Text('All Categories')),
    );
  }
}
