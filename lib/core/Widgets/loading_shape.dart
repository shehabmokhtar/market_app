import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/loading_container.dart';

// ignore: must_be_immutable
class LoadingShapeFullScreen extends StatelessWidget {
  LoadingShapeFullScreen(
      {super.key, required this.child, required this.condition});
  Widget child;
  bool condition;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (condition) const LoadingContainer(),
      ],
    );
  }
}
