
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
      "correctIndex": 1
    },
    {
      "question": "Identify the sport based on the field.",
      "answers": ["Football", "Basketball", "Tennis", "Shuttlecock"],
      "correctIndex": 2
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
          builder: (context) =>
              ResultScreen(score: correctAnswers, total: questions.length),
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
        elevation: 2,
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
                bool isCorrect = index == questions[currentQuestionIndex]["correctIndex"];
                bool isSelected = selectedAnswer == index;

                return InkWell(
                  onTap: () => checkAnswer(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
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
            ElevatedButton(
              onPressed: isAnswered ? nextQuestion : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isAnswered ? Colors.green : Colors.grey,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                currentQuestionIndex < questions.length - 1
                    ? "Nästa fråga"
                    : "Nästa fråga",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultScreen({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    double percentage = (score / total) * 100;
    IconData arrowIcon;
    Color arrowColor;

    if (percentage >= 50) {
      arrowIcon = Icons.arrow_upward;
      arrowColor = Colors.green;
    } else {
      arrowIcon = Icons.arrow_downward;
      arrowColor = Colors.red;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              arrowIcon,
              color: arrowColor,
              size: 80,
            ),
            const SizedBox(height: 16),
            Text(
              percentage >= 50 ? "Great job!" : "Maybe next time",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "$score / $total correct answers",
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text("Retry quiz",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}