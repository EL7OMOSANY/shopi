// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

extension DateEx on DateTime {
  String getFormatDayMonthYear() {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }
}
