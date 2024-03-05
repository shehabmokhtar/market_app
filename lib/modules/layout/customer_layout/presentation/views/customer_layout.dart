import 'package:flutter/material.dart';
import 'package:market_app/core/constants/variables.dart';
import 'package:market_app/modules/layout/customer_layout/presentation/views/widgets/customer_navbar.dart';
import 'package:market_app/modules/layout/customer_layout/presentation/views/widgets/layout_screens.dart';

class CustomerLayout extends StatefulWidget {
  const CustomerLayout({super.key});

  @override
  State<CustomerLayout> createState() => _CustomerLayoutState();
}

class _CustomerLayoutState extends State<CustomerLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppVariables.layoutContext = context;
    return Scaffold(
      body: CustomerLayoutScreens.screens[currentIndex],
      bottomNavigationBar: CustomerNavBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
