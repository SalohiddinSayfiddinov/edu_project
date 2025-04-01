import 'package:edu_project/habit/home.dart';
import 'package:edu_project/habit/login.dart';

import 'package:edu_project/homehabi.dart';
import 'package:edu_project/tr%C3%A4ningsprov.dart';
import 'package:edu_project/homescreen.dart';
import 'package:edu_project/quiz.dart';
import 'package:edu_project/todolist.dart';
import 'package:flutter/material.dart';

import 'presentation/auth/view/frist_page.dart';

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
      home: MainScreen(),
    );
  }
}
