import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/responsive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vibration/vibration.dart';

enum MessageType { success, error, warning }

class AppUtilities {
  // vibration
  static vibration({
    int duration = 30,
  }) async {
    if ((await Vibration.hasVibrator())!) {
      Vibration.vibrate(duration: duration);
    } else {
      print('The Device does not support vibration');
    }
  }

  // Check internet connection true/false
  static Future<bool> checkInternet() async {
    return await InternetConnectionChecker().hasConnection;
  }

  // Function to navigate to a new page
  static void navigateToNewPage({
    required BuildContext context,
    required Widget newPage,
    PageTransitionType pageTransitionType = PageTransitionType.rightToLeft,
  }) {
    Navigator.push(
      context,
      PageTransition(
        type: pageTransitionType,
        child: newPage,
      ),
    );
  }

// Function to navigate to a new page and finish
  static void navigateToAndFinish({
    required BuildContext context,
    required Widget newPage,
  }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => newPage),
    );
  }

  static void toastMessage({
    required BuildContext context,
    required String msg,
    required MessageType messageType,
    Toast toastLength = Toast.LENGTH_SHORT,
    ToastGravity gravity = ToastGravity.BOTTOM,
  }) {
    Color? color;
    switch (messageType) {
      case MessageType.success:
        color = AppColors.successColor;
        break;
      case MessageType.error:
        color = AppColors.errorColor;
        break;
      case MessageType.warning:
        color = AppColors.warningColor;
        break;
      default:
        color = Colors.black;
        break;
    }

    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: Responsive.isMobile(context)
          ? 16
          : Responsive.isTablet(context)
              ? 20
              : 24,
    );
  }
}
