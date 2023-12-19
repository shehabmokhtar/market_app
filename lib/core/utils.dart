import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:vibration/vibration.dart';

class AppUtilities {
  // vibration
  static vibration({
    int duration = 50,
  }) async {
    if ((await Vibration.hasVibrator())!) {
      Vibration.vibrate(duration: duration);
    } else {
      print('The Device does not support vibration');
    }
  }

  // Check internet connection true/false
  static Future<bool> isThereInternet() async {
    return await InternetConnectionChecker().hasConnection;
  }

  // Function to navigate to a new page
  static void navigateToNewPage({
    required BuildContext context,
    required Widget newPage,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => newPage,
      ),
    );
  }
}
