import 'package:intl/intl.dart';

class NumberUtils {
  static formatNumberToCompactCurrency(dynamic numberToFormat) {
    return NumberFormat.compact().format(numberToFormat);
  }

  static formatNumberToCurrency(dynamic numberToFormat) {
    return NumberFormat.decimalPattern().format(numberToFormat).replaceAll('.', ".");
  }

  static padNumber(int? number) {
    return number == null
        ? "0"
        : number < 10
            ? "$number"
            : "$number";
  }
}
