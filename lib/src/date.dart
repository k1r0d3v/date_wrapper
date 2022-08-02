/// Date class that wraps [DateTime].
class Date {
  // Weekday constants
  static const int monday = DateTime.monday;
  static const int tuesday = DateTime.tuesday;
  static const int wednesday = DateTime.wednesday;
  static const int thursday = DateTime.thursday;
  static const int friday = DateTime.friday;
  static const int saturday = DateTime.saturday;
  static const int sunday = DateTime.sunday;
  static const int daysPerWeek = DateTime.daysPerWeek;

  /// The [DateTime] that wraps this class.
  ///
  /// This time part of this [DateTime] is ignored in the operations,
  /// and defaults to 0 in its construction.
  final DateTime dateTime;

  /// Constructs a [Date] instance, refer to [DateTime] to more information.
  ///
  /// For example, to create a [Date] object:
  /// ```dart
  /// final myFavouriteDay = Date(1994, 9, 24);
  /// ```
  Date(int year, int month, int day)
      : dateTime = DateTime.utc(year, month, day);

  /// Constructs a new [Date] instance based on [dateTime].
  ///
  /// This takes the date part of the given [DateTime]
  /// and discards the rest.
  Date.of(DateTime dateTime)
      : dateTime = DateTime.utc(dateTime.year, dateTime.month, dateTime.day);

  /// Constructs a [Date] instance with current date.
  ///
  /// ```dart
  /// final now = Date.today();
  /// ```
  Date.today() : dateTime = Date.of(DateTime.now()).dateTime;

  /// Returns a human-readable string for this instance.
  ///
  /// This method takes the date part of [DateTime.toString].
  @override
  String toString() => dateTime.toString().split(' ')[0];

  /// Returns true if [other] is a [Date] at the same date.
  ///
  /// Refer to [DateTime] for more information.
  @override
  bool operator ==(Object other) {
    if (other is Date) {
      return dateTime == other.dateTime;
    } else {
      return this == other;
    }
  }

  /// Refer to [DateTime] for more information.
  @override
  int get hashCode => dateTime.hashCode;

  /// Refer to [DateTime] for more information.
  int get year => dateTime.year;

  /// Refer to [DateTime] for more information.
  int get month => dateTime.month;

  /// Refer to [DateTime] for more information.
  int get day => dateTime.day;

  /// Refer to [DateTime] for more information.
  int get weekday => dateTime.weekday;

  /// Returns the last day of this [Date] month.
  int get lastDayOfMonth => Date(year, month + 1, 0).day;

  /// Refer to [DateTime] for more information.
  bool isBefore(Date other) => dateTime.isBefore(other.dateTime);

  /// Refer to [DateTime] for more information.
  bool isAfter(Date other) => dateTime.isAfter(other.dateTime);

  /// Refer to [DateTime] for more information.
  int compareTo(Date other) => dateTime.compareTo(other.dateTime);

  /// Refer to [DateTime] for more information.
  Duration difference(Date other) => dateTime.difference(other.dateTime);

  /// Refer to [DateTime] for more information.
  Date add(Duration duration) => Date.of(dateTime.add(duration));

  /// Refer to [DateTime] for more information.
  Date subtract(Duration duration) => Date.of(dateTime.subtract(duration));

  /// Refer to [DateTime] for more information.
  Date copyWith({int? year, int? month, int? day}) =>
      Date(year ?? this.year, month ?? this.month, day ?? this.day);
}

/// Extension on [DateTime] to easily transform [DateTime] to [Date].
///
extension DateExtension on DateTime {
  Date get date => Date.of(this);
}
