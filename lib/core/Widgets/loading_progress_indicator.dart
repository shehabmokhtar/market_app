import 'package:flutter/material.dart';

class LoadingProgressIndicator extends StatelessWidget {
  const LoadingProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(
          seconds: 1,
        ),
        color: Colors.black.withOpacity(.3),
        child: const Center(child: CircularProgressIndicator()),
      );
}
