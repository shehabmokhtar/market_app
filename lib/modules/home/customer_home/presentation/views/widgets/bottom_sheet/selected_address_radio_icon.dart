import 'package:flutter/material.dart';

class SelectedAddressRadioIcon extends StatelessWidget {
  const SelectedAddressRadioIcon({
    super.key,
    required this.radioButtonStatus,
  });

  final bool radioButtonStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Center(
        child: Icon(
          radioButtonStatus
              ? Icons.radio_button_checked
              : Icons.radio_button_off_outlined,
        ),
      ),
    );
  }
}
