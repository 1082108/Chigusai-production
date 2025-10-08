import ‘package:flutter/material.dart’;
import ‘quiz_page.dart’;

void main() {
  runApp(const QuizApp());
}

Class QuizApp extends StatelessWidget {
  Const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    Return MaterialApp(
      Title: ‘暇つぶしクイズ’,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      Home: const QuizPage(),
    );
  }
}
