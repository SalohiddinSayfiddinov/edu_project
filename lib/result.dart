import 'package:edu_project/hello.dart';
import 'package:edu_project/homescreen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.onRestart,
    required int scorePercent,
  });

  @override
  Widget build(BuildContext context) {
    double percent = (correctAnswers / totalQuestions) * 100;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E6),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Homescreen()));
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: const Color(0xFFFFF8E6),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PercentIndicator(
              percent: percent,
              primaryColor: percent >= 59 ? Color(0xFF94D073) : Colors.red,
              centerWidgetBuilder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '✅ $correctAnswers',
                      style: const TextStyle(fontSize: 24, color: Colors.green),
                    ),
                    Text(
                      '❌ ${totalQuestions - correctAnswers}',
                      style: const TextStyle(fontSize: 24, color: Colors.red),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
