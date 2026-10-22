/// Date helpers shared by the habit loop, the streak rules and the data packs.
library;

/// Date-only utilities.
///
/// The habit loop is defined in whole days, so all comparisons strip the time
/// component first. That keeps the streak rule stable regardless of the hour a
/// student completes their clips.
extension DateX on DateTime {
  /// This date at midnight local time.
  DateTime get dateOnly => DateTime(year, month, day);

  /// The day after this date.
  DateTime get nextDay => dateOnly.add(const Duration(days: 1));

  /// The day before this date.
  DateTime get previousDay => dateOnly.subtract(const Duration(days: 1));

  /// Whole days between this date and [other], ignoring the time of day.
  ///
  /// The result is positive when [other] is in the future.
  int daysUntil(DateTime other) => other.dateOnly.difference(dateOnly).inDays;

  /// Whether this date and [other] fall on the same calendar day.
  bool isSameDay(DateTime other) => year == other.year && month == other.month && day == other.day;

  /// An ISO-8601 date without a time component (`yyyy-MM-dd`).
  String get isoDate => '${year.toString().padLeft(4, '0')}-'
      '${month.toString().padLeft(2, '0')}-'
      '${day.toString().padLeft(2, '0')}';
}

/// Parses an ISO-8601 date string, returning `null` when it cannot be read.
DateTime? tryParseDate(Object? value) {
  if (value is DateTime) return value;
  if (value is! String || value.isEmpty) return null;
  return DateTime.tryParse(value);
}
