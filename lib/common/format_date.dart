import 'package:intl/intl.dart';

String formatDate() {
  return DateFormat("EEEE dd MMMM").format(DateTime.now()).toString();
}