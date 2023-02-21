import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  bool? isAfterOrEqualTo(DateTime dateTime) {
    final date = this;
    if (date != null) {
      final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
      return isAtSameMomentAs | date.isAfter(dateTime);
    }
    return null;
  }

  bool? isBeforeOrEqualTo(DateTime dateTime) {
    final date = this;
    if (date != null) {
      final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
      return isAtSameMomentAs | date.isBefore(dateTime);
    }
    return null;
  }

  bool? isBetween(
    DateTime fromDateTime,
    DateTime toDateTime,
  ) {
    final date = this;
    if (date != null) {
      final isAfter = date.isAfterOrEqualTo(fromDateTime) ?? false;
      final isBefore = date.isBeforeOrEqualTo(toDateTime) ?? false;
      return isAfter && isBefore;
    }
    return null;
  }

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this!.year,
      month ?? this!.month,
      day ?? this!.day,
      hour ?? this!.hour,
      minute ?? this!.minute,
      second ?? this!.second,
      millisecond ?? this!.millisecond,
      microsecond ?? this!.microsecond,
    );
  }

  String? toDateTime() {
    final date = this;
    if (date != null) {
      return DateFormat("E, d MMM y hh:mm a").format(date);
    }
    return null;
  }

  String? toBookDate() {
    final date = this;
    if (date != null) {
      return DateFormat("MMM d hh:mm a").format(date);
    }
    return null;
  }

  String? toDate() {
    final date = this;
    if (date != null) {
      return DateFormat("E, d MMM y").format(date);
    }
    return null;
  }

  String? weekdayName() {
    final date = this;
    if (date != null) {
      return DateFormat('EEEE').format(date);
    }
    return null;
  }

  String? militaryTime() {
    final date = this;
    if (date != null) {
      return DateFormat.Hm().format(date); //13:01
    }
    return null;
  }

  String? civilianTime() {
    final date = this;
    if (date != null) {
      return DateFormat('h:mm a').format(date);
    }
    return null;
  }
}
