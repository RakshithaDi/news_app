import 'dart:developer';

import 'package:intl/intl.dart';

class NewsDateTimeConverter {
  static String formatDate(String inputDateStr) {
    try {
      DateTime inputDate = DateTime.parse(inputDateStr);
      return DateFormat('EEEE, d MMMM y').format(inputDate);
    } catch (e) {
      log(e.toString());
      return "invalid date format";
    }
  }
}
