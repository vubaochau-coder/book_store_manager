extension DateTimeX on DateTime {
  DateTime getMonthAndYear() {
    return DateTime(year, month);
  }

  DateTime startOfMonth() {
    return DateTime(year, month);
  }

  DateTime endOfMonth() {
    final nextMonth = month < 12 ? month + 1 : 1;
    final nextYear = nextMonth == 1 ? year + 1 : year;
    final endOfMonth = DateTime(nextYear, nextMonth, 0);
    return endOfMonth;
  }
}
