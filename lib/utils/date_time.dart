import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateFormat monthCol = DateFormat("MM_yyyy");

  static DateTime stringToYear(String year) {
    int res = int.parse(year);
    return DateTime(res);
  }

  static String monthCollection(DateTime dateTime) {
    return monthCol.format(dateTime);
  }

  static String monthYearString(DateTime dateTime) {
    DateFormat temp = DateFormat("MM/yyyy");
    return temp.format(dateTime);
  }

  static String orderTime(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('HH:mm dd/MM/yyyy');
    return dateFormat.format(dateTime);
  }

  static String getYear(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('yyyy');
    return dateFormat.format(dateTime);
  }
}
