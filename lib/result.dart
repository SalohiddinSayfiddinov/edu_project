import 'package:flutter/material.dart';
import 'package:edu_project/hello.dart';

class ResultScreen extends StatelessWidget {
  final double scorePercent; 
  const ResultScreen({super.key, required this.scorePercent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E6), 
      body: Center(
        child: PercentIndicator(
          percent: scorePercent, 
          primaryColor: Colors.green, 
          linesColor: Colors.grey.shade800,
          shadowColor: Colors.greenAccent,
        ),
      ),
    );
  }
}