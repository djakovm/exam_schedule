String timeLeftString(DateTime target) {
  final now = DateTime.now();
  if (target.isBefore(now)) return 'Поминато';
  final diff = target.difference(now);
  final days = diff.inDays;
  final hours = diff.inHours - days * 24;
  return '$days дена, $hours часа';
}

String dateLabel(DateTime dt) {
  return '${_two(dt.day)}.${_two(dt.month)}.${dt.year}';
}

String timeLabel(DateTime dt) {
  return '${_two(dt.hour)}:${_two(dt.minute)}';
}

String _two(int v) => v.toString().padLeft(2, '0');
