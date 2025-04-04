


import 'package:edu_project/screens/book_audio.dart';
import 'package:edu_project/screens/lesson_page_for_payed_customer.dart';
import 'package:edu_project/screens/my_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'presentation/auth/view/frist_page.dart';

void main() { SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
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



      home: BookAudio(),


    );
  }
}
