import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateFormat monthCol = DateFormat("MM_yyyy");

  static String monthCollection(DateTime dateTime) {
    return monthCol.format(dateTime);
  }
}
