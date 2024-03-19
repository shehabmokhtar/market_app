import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AwesomeDialog customAwesomeDialog({
  required DialogType dialogType,
  required BuildContext context,
  required String titleMessage,
  required String descMessage,
  String btnOkText = 'OK',
  required Function btnOkonPress,
  // required Function btnCancelOnPress,
}) {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.scale,
    title: titleMessage,
    desc: descMessage,
    // btnCancelOnPress: () {},
    btnOkText: btnOkText,
    btnOkOnPress: () {
      btnOkonPress();
    },
  );
}
