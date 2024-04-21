import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message, [Color backgroundColor = Colors.red]) {
  Fluttertoast.showToast(msg: message, backgroundColor: backgroundColor);
}
