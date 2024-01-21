import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveCircleIndicator extends StatelessWidget {
  final String os;

  const AdaptiveCircleIndicator({
    super.key,
    required this.os,
  });

  @override
  Widget build(BuildContext context) {
    if (os == 'ios') {
      return const CupertinoActivityIndicator();
    }
    return const CircularProgressIndicator();
  }
}
