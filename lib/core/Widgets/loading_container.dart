import 'package:flutter/cupertino.dart';
import 'package:market_app/core/Widgets/loading_progress_indicator.dart';
import 'package:market_app/core/styles/colors.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black.withOpacity(.05),
      child: const LoadingProgressIndicator(),
    );
  }
}
