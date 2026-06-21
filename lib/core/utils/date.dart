import 'package:timeago/timeago.dart' as timeago;

class Time {
 static String timeFormat(String time) {
  final dateTime = DateTime.parse(time);
  return timeago.format(dateTime);
}

}