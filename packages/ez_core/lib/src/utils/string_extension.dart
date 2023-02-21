import 'package:intl/intl.dart';

extension StringHelper on String {
  bool parseBool() {
    if (toLowerCase() == 'true') {
      return true;
    } else if (toLowerCase() == 'false') {
      return false;
    }

    throw '"$this" can not be parsed to boolean.';
  }

  String initials() => isNotEmpty
      ? trim().split(RegExp(' +')).map((s) => s[0]).take(2).join().toUpperCase()
      : '';
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String toDateReadable() {
    return DateFormat("E, d MMM y hh:mm a").format(DateTime.parse(this));
  }

  String toDateNotification() {
    return DateFormat("MMM d,  y").format(DateTime.parse(this));
  }
}
