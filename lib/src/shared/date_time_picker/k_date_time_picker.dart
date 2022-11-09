import 'package:flutter/material.dart'
    show BuildContext, TimeOfDay, showDatePicker, showTimePicker;

Future<DateTime?> selectDateTimeFromPicker(BuildContext context,
    [DateTime? initialDateTime]) async {
  DateTime? date = await selectDateFromPicker(context);
  if (date == null) return null;
  // ignore: use_build_context_synchronously
  final TimeOfDay? time = await selectTimeFromPicker(context);

  if (time == null) return date;

  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}

Future<DateTime?> selectDateFromPicker(BuildContext context,
    [DateTime? initialDateTime]) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDateTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030));
  if (picked != null) {
    return picked;
  }
  return null;
}

Future<TimeOfDay?> selectTimeFromPicker(BuildContext context,
    [DateTime? initialDateTime]) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: initialDateTime != null
        ? TimeOfDay.fromDateTime(initialDateTime)
        : TimeOfDay.now(),
  );
  if (picked != null) {
    return picked;
  }
  return null;
}
