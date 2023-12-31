extension DateTimeX on DateTime {
  DateTime toDateOnly() {
    return DateTime(year, month, day);
  }

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

  int getDaysOfMonth() {
    if ([1, 3, 5, 7, 8, 10, 12].contains(month)) {
      return 31;
    } else if ([4, 6, 9, 11].contains(month)) {
      return 30;
    } else {
      if (year % 4 == 0) {
        if (year % 100 == 0) {
          if (year % 400 == 0) {
            return 29;
          }
        } else {
          return 29;
        }
      }
      return 28;
    }
  }
}
