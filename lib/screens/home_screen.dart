import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final String indexNumber;

  const HomeScreen({super.key, required this.indexNumber});

  List<Exam> _exams() {
    final now = DateTime.now();
    final base = DateTime(now.year, now.month, now.day, 9, 0);
    final data = <Exam>[
      Exam(subject: 'Дискретна математика', dateTime: base.add(const Duration(days: -20, hours: 1)), rooms: ['223', '117']),
      Exam(subject: 'Професионални вештини', dateTime: base.add(const Duration(days: -10, hours: 2)), rooms: ['200ab']),
      Exam(subject: 'Структурно програмирање', dateTime: base.add(const Duration(days: -5, hours: 3)), rooms: ['200v', 'b3.2']),
      Exam(subject: 'Архитектура и организација на компјутери', dateTime: base.add(const Duration(days: -2, hours: 1)), rooms: ['b3.1']),
      Exam(subject: 'Бизнис статистика', dateTime: base.add(const Duration(days: 1, hours: 2)), rooms: ['AMF MF', 'AMF FINKI']),
      Exam(subject: 'Маркетинг', dateTime: base.add(const Duration(days: 2, hours: 1)), rooms: ['2']),
      Exam(subject: 'Објектно-ориентирано програмирање', dateTime: base.add(const Duration(days: 3, hours: 3)), rooms: ['3', '138']),
      Exam(subject: 'Основи на Веб дизајн', dateTime: base.add(const Duration(days: 4, hours: 2)), rooms: ['223']),
      Exam(subject: 'Алгоритми и податочни структури', dateTime: base.add(const Duration(days: 5, hours: 1)), rooms: ['117', '200ab']),
      Exam(subject: 'Интернет програмирање на клиентска страна', dateTime: base.add(const Duration(days: 6, hours: 2)), rooms: ['200v']),
      Exam(subject: 'Компјутерски мрежи и безбедност', dateTime: base.add(const Duration(days: 7, hours: 1)), rooms: ['b3.2']),
      Exam(subject: 'Напредно програмирање', dateTime: base.add(const Duration(days: 8, hours: 2)), rooms: ['b3.1', 'AMF MF']),
      Exam(subject: 'Шаблони за дизајн на кориснички интерфејси', dateTime: base.add(const Duration(days: 9, hours: 3)), rooms: ['AMF FINKI']),
      Exam(subject: 'Визуелно програмирање', dateTime: base.add(const Duration(days: 10, hours: 1)), rooms: ['2']),
      Exam(subject: 'Е-влада', dateTime: base.add(const Duration(days: 11, hours: 2)), rooms: ['3', '138']),
      Exam(subject: 'Интернет технологии', dateTime: base.add(const Duration(days: 12, hours: 3)), rooms: ['223']),
      Exam(subject: 'Оперативни системи', dateTime: base.add(const Duration(days: 13, hours: 1)), rooms: ['117', '200ab']),
      Exam(subject: 'Софтверско инженерство', dateTime: base.add(const Duration(days: 14, hours: 2)), rooms: ['200v']),
      Exam(subject: 'Бази на податоци', dateTime: base.add(const Duration(days: 15, hours: 3)), rooms: ['b3.2']),
      Exam(subject: 'Веб програмирање', dateTime: base.add(const Duration(days: 16, hours: 1)), rooms: ['b3.1', 'AMF MF']),
      Exam(subject: 'Дизајн на интеракцијата човек-компјутер', dateTime: base.add(const Duration(days: 17, hours: 2)), rooms: ['AMF FINKI']),
      Exam(subject: 'Електронска и мобилна трговија', dateTime: base.add(const Duration(days: 18, hours: 3)), rooms: ['2', '3']),
    ];

    data.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final exams = _exams();
    return Scaffold(
      appBar: AppBar(title: Text('Распоред за испити - $indexNumber')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: exams.length,
        itemBuilder: (context, i) {
          final e = exams[i];
          return ExamCard(
            exam: e,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ExamDetailScreen(exam: e),
              ));
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Chip(
                labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                label: Text('Вкупно испити: ${exams.length}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
