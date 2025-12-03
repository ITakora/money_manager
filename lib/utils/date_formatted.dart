import 'package:intl/intl.dart';

class DateFormatted {
  static const String _dateFormat = "dd MMM yyyy";

  static String getDateFormatted(String date) {
    DateTime parsedDate = DateTime.parse(date);

    return DateFormat(_dateFormat).format(parsedDate);
  }

  static String getTodayFormatted () {
    DateTime now = DateTime.now();

        return DateFormat(_dateFormat).format(now);
  }

}