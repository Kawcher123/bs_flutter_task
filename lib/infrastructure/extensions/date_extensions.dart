import 'package:intl/intl.dart';

extension DateExtentions on DateTime{
  String get toFormattedTime => DateFormat.jm().format(this);
  String get toFormattedDay => DateFormat.d().format(this);
  String get toFormattedMonth => DateFormat.MMM().format(this);
}