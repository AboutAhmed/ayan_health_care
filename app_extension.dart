
import 'package:ayan_healthcare/helper/numeral.dart';
import 'package:intl/intl.dart';

extension ExtensionNumeral on num {
  String numeral({int fractionDigits = 2}) {
    return Numeral(this).format(fractionDigits: fractionDigits);
  }
}

extension ExtensionDateTime on DateTime {
  ///
  String get customFormat {
    final now = DateTime.now();

    final DateTime checkDate = DateTime(year, month, day);

    final timeFormat = DateFormat.jm();
    final dayFormat = DateFormat.EEEE();
    final dateFormat = DateFormat.yMd();

    int difference = now.difference(checkDate).inDays;

    if (difference == 0) {
      return timeFormat.format(this);
    } else if (difference == 1) {
      return "Yesterday";
    } else if (difference <= 6) {
      return dayFormat.format(checkDate);
    }

    return dateFormat.format(checkDate);
  }
}
