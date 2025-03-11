import 'package:edu_project/quiz.dart';
import 'package:edu_project/todolist.dart';
import 'package:flutter/material.dart';

import 'presentation/auth/view/frist_page.dart';
import 'presentation/auth/view/on_boarding_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: QuizScreen(),
    );
  }
}
