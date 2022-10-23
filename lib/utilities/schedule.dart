import 'package:flutter/material.dart' show TimeOfDay;

class Schedule {
  final String name;
  final TimeOfDay start;
  final TimeOfDay end;

  const Schedule(this.name, this.start, this.end);

  @override
  String toString() =>
      '${start.hourOfPeriod.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}${start.period.name} - '
      '${end.hourOfPeriod.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}${end.period.name}';

  static Schedule get morning => const Schedule('Morning',
      TimeOfDay(hour: 06, minute: 00), TimeOfDay(hour: 11, minute: 59));
  static Schedule get afternoon => const Schedule('Afternoon',
      TimeOfDay(hour: 12, minute: 00), TimeOfDay(hour: 16, minute: 59));
  static Schedule get evening => const Schedule('Evening',
      TimeOfDay(hour: 17, minute: 00), TimeOfDay(hour: 19, minute: 59));
  static Schedule get night => const Schedule('Night',
      TimeOfDay(hour: 20, minute: 00), TimeOfDay(hour: 05, minute: 59));
}
