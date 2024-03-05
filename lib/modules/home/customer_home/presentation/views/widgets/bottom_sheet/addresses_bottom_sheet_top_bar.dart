import 'package:flutter/material.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/addresses_topic_text.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/bottom_sheet/edit_addreses_button.dart';

class AdressesBottomSheetTopBar extends StatelessWidget {
  const AdressesBottomSheetTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        AddresesTopicText(),
        Spacer(),
        EditAddresesButton(),
      ],
    );
  }
}
