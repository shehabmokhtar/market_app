import 'package:flutter/material.dart';

class ConditionalBuilder extends StatelessWidget {
  const ConditionalBuilder({
    super.key,
    required this.condition,
    required this.isTrue,
    required this.isFalse,
  });

  final bool condition;
  final Widget isTrue;
  final Widget isFalse;

  @override
  Widget build(BuildContext context) => condition ? isTrue : isFalse;
}
