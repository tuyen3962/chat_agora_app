import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TimeAgo {
  static String timeAgoSinceDate(String unixTimestamp, {bool numericDates = true, String formatDate = "yyyy-MM-dd"}) {
    initializeDateFormatting();
    DateTime date = DateTime.fromMillisecondsSinceEpoch(int.tryParse(unixTimestamp)!);

    final date2 = DateTime.now();
    final difference = date2.difference(date);

    // var language = Get.locale!.languageCode;
    var language = "ko";

    String week = "";
    String days = "";
    String one_day = "";
    String hours = "";
    String one_hour = "";
    String minutes = "";
    String one_minute = "";
    String just_now = "";

    switch (language) {
      case "ko":
        week = (numericDates) ? '1주 전' : '지난주';
        days = '${difference.inDays}일 전';
        one_day = (numericDates) ? '1일 전' : '어제';
        hours = '${difference.inHours}시간 전';
        one_hour = (numericDates) ? '1시간 전' : '한시간';
        minutes = '${difference.inMinutes}분 전';
        one_minute = (numericDates) ? '1분 전' : '잠시';
        just_now = "방금";
        break;
      default:
        week = (numericDates) ? '1 week ago' : 'Last week';
        days = '${difference.inDays} days ago';
        one_day = (numericDates) ? '1 day ago' : 'Yesterday';
        hours = '${difference.inHours} hours ago';
        one_hour = (numericDates) ? '1 hour ago' : 'One hour';
        minutes = '${difference.inMinutes} minutes ago';
        one_minute = (numericDates) ? '1 minute ago' : 'One minute';
        just_now = "Just now";
        break;
    }

    if (difference.inDays > 8) {
      return DateFormat(formatDate, language).format(date);
    } else if ((difference.inDays / 7).floor() >= 1) {
      return week;
    } else if (difference.inDays >= 2) {
      return days;
    } else if (difference.inDays >= 1) {
      return one_day;
    } else if (difference.inHours >= 2) {
      return hours;
    } else if (difference.inHours >= 1) {
      return one_hour;
    } else if (difference.inMinutes >= 2) {
      return minutes;
    } else if (difference.inMinutes >= 1) {
      return one_minute;
    } else {
      return just_now;
    }
  }
}
