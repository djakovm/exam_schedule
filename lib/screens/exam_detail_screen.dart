import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../utils/date_format.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exam.subject)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(Icons.calendar_today),
              const SizedBox(width: 8),
              Text('${dateLabel(exam.dateTime)} • ${timeLabel(exam.dateTime)}', style: Theme.of(context).textTheme.titleMedium),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              const Icon(Icons.room),
              const SizedBox(width: 8),
              Expanded(child: Text(exam.rooms.join(', '))),
            ]),
            const SizedBox(height: 24),
            Text('Преостанува: ${timeLeftString(exam.dateTime)}', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
