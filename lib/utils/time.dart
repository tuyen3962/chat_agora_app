import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Time {
  static convertSecondsToMMSS(int secTime) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = secTime ~/ 60;
    int sec = secTime % 60;

    String parsedTime = getParsedTime(min.toString()) + " : " + getParsedTime(sec.toString());

    return parsedTime;
  }

  static formatSecondDuration(int secTime) {
    if (secTime < 60) {
      return "$secTime ${secTime > 1 ? "secs" : "sec"}";
    } else if (secTime < 3600) {
      Duration duration = Duration(seconds: 120);
      var mins = duration.inMinutes;
      return "$mins ${mins > 1 ? "mins" : "min"}";
    } else {
      int hours = (secTime / 3600).truncate();
      secTime = (secTime % 3600).truncate();
      int minutes = (secTime / 60).truncate();

      String hoursStr = (hours).toString().padLeft(2, '0');
      String minutesStr = (minutes).toString().padLeft(2, '0');
      return "$hoursStr ${int.parse(hoursStr) > 1 ? "hours" : "hour"} $minutesStr ${int.parse(minutesStr) > 1 ? "mins" : "min"}";
    }
  }

  static formatUnixTimestamp(int unixTimestamp) {
    initializeDateFormatting();

    DateTime date = DateTime.fromMillisecondsSinceEpoch(unixTimestamp);
    final date2 = DateTime.now();
    if (date.year != date2.year) {
      return DateFormat("yyyy-MM-dd", "ko").format(date);
    } else if (date.month != date2.month || date.day != date2.day) {
      return DateFormat("MMM dd일 • a h시 mm분 ", "ko").format(date);
    }
    return DateFormat("EEEE • a h시 mm분", "ko").format(date);
  }
}
