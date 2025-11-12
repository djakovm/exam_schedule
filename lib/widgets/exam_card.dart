import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../utils/date_format.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isPast = exam.isPast;
    final color = isPast ? Colors.grey.shade300 : Colors.green.shade100;
    return Card(
      elevation: 2,
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exam.subject, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 18),
                  const SizedBox(width: 6),
                  Text('${dateLabel(exam.dateTime)}  •  ${timeLabel(exam.dateTime)}'),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.room, size: 18),
                  const SizedBox(width: 6),
                  Expanded(child: Text(exam.rooms.join(', '))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
