Import ‘package:flutter/material.dart’;
Import ‘dart:math’;
Import ‘quiz_data.dart’;

Class QuizPage extends StatefulWidget {
  Const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

Class _QuizPageState extends State<QuizPage> {
  Late Map<String, dynamic> currentQuestion;
  Bool showAnswer = false;

  @override
  Void initState() {
    Super.initState();
    _loadRandomQuestion();
  }

  Void _loadRandomQuestion() {
    Final random = Random();
    currentQuestion = quizList[random.nextInt(quizList.length)];
    showAnswer = false;
  }

  Void _selectAnswer(int index) {
    setState(() {
      showAnswer = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Return Scaffold(
      appBar: AppBar(
        title: const Text(‘暇つぶしクイズ’),
        centerTitle: true,
      ),
      Body: Padding(
        Padding: const EdgeInsets.all(20),
        Child: Center(
          Child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion[‘question’] as String,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Const SizedBox(height: 30),
              …List.generate(4, (index) {
                Return Container(
                  Margin: const EdgeInsets.symmetric(vertical: 6),
                  Width: double.infinity,
                  Child: ElevatedButton(
                    onPressed: showAnswer ? null : () => _selectAnswer(index),
                    child: Text(currentQuestion[‘options’][index] as String),
                  ),
                );
              }),
              Const SizedBox(height: 20),
              If (showAnswer) …[
                Text(
                  ‘正解：${currentQuestion[‘options’][currentQuestion[‘answer’]]}’,
                  Style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
                Const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _loadRandomQuestion();
                    });
                  },
                  Icon: const Icon(Icons.refresh),
                  Label: const Text(‘次の問題へ’),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
