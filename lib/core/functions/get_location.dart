import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:geolocator/geolocator.dart';
import 'package:market_app/core/functions/custom_awesome_dialog.dart';
import 'package:market_app/core/services/global_variables.dart';

/// Determine the current position of the device.
Future<Position?> getLocation(context) async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  LocationPermission permission;

  // check the location service enabled or not
  if (!serviceEnabled) {
    await customAwesomeDialog(
      dialogType: DialogType.error,
      context: context,
      titleMessage: 'Location Service Disabled',
      descMessage: 'To enable location service go to settings',
      btnOkText: 'Go to settings',
      btnOkonPress: () {
        Geolocator.openLocationSettings();
      },
    ).show();
  } else {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return await Geolocator.getCurrentPosition();
    }
  }
  return null;
}

Future<void> userLocation(context) async {
  userCurrentLocation = await getLocation(context);
}
