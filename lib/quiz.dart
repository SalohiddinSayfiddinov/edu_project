import 'package:edu_project/presentation/widgets/my_button.dart';
import 'package:edu_project/result.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswer;
  int correctAnswers = 0;
  int currentQuestionIndex = 0;
  bool isAnswered = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question": "The image below is a field image used for?",
      "answers": ["Football", "Basketball", "Tennis", "Shuttlecock"],
      "correctIndex": 0
    },
    {
      "question": "Which sport uses this field?",
      "answers": ["Football", "Basketball", "Tennis", "Shuttlecock"],
      "correctIndex": 0
    },
    {
      "question": "Identify the sport based on the field.",
      "answers": ["Football", "Basketball", "Tennis", "Shuttlecock"],
      "correctIndex": 0
    },
    {
      "question": "Identify the sport based on the field.",
      "answers": ["Football", "Basketball", "Tennis", "Shuttlecock"],
      "correctIndex": 0
    },
    {
      "question": "Identify the sport based on the field.",
      "answers": ["Football", "Basketball", "Tennis", "Shuttlecock"],
      "correctIndex": 0
    },
  ];

  void checkAnswer(int index) {
    if (!isAnswered) {
      setState(() {
        selectedAnswer = index;
        isAnswered = true;
        if (index == questions[currentQuestionIndex]["correctIndex"]) {
          correctAnswers++;
        }
      });
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
        isAnswered = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            scorePercent: ((correctAnswers / questions.length) * 100).toInt(),
            correctAnswers: correctAnswers,
            totalQuestions: questions.length,
            onRestart: () {
              setState(() {
                currentQuestionIndex = 0;
                correctAnswers = 0;
                selectedAnswer = null;
                isAnswered = false;
              });
              Navigator.pop(context);
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8E6),
        title: const Text("Träningsprov",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/Group 162446.png',
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              questions[currentQuestionIndex]["question"],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Column(
              children: List.generate(4, (index) {
                bool isCorrect =
                    index == questions[currentQuestionIndex]["correctIndex"];
                bool isSelected = selectedAnswer == index;

                return InkWell(
                  onTap: () => checkAnswer(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 12),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? (isCorrect ? Colors.green : Colors.red)
                            : Colors.grey.shade300,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            questions[currentQuestionIndex]["answers"][index],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        if (isAnswered && isSelected)
                          Icon(
                            isCorrect ? Icons.check_circle : Icons.cancel,
                            color: isCorrect ? Colors.green : Colors.red,
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            const Spacer(),
            MyButton(
                title: 'NastaFraga',
                onPressed: isAnswered ? nextQuestion : null),
          ],
        ),
      ),
    );
  }
}
