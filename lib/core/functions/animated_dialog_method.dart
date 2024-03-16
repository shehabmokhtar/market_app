import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

AwesomeDialog customAwesomeDialog({
  required BuildContext context,
  required String titleMessage,
  required String descMessage,
}) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.scale,
    title: titleMessage,
    desc: descMessage,
    // btnCancelOnPress: () {},
    btnOkOnPress: () {
      Navigator.pop(context);
    },
  );
}
