import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: const HomeScreen(indexNumber: '223078'),
    );
  }
}
