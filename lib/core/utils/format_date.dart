import 'package:intl/intl.dart';

String formatDateTime(String datetime) {
  return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(datetime));
}
