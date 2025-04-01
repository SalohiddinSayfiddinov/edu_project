import 'package:edu_project/cubit/bottomNavBar_cubit.dart';
import 'package:edu_project/screens/book_audio.dart';
import 'package:edu_project/screens/my_book.dart';
import 'package:edu_project/widgets/main_bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




final List<Widget> pages = [
  Center(child: Text('Главная', style: TextStyle(fontSize: 24))),
  Center(child: Text('Исследование', style: TextStyle(fontSize: 24))),
 MyBook(),
 BookAudio(), 
  Center(child: Text('Профиль', style: TextStyle(fontSize: 24))),
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: Scaffold(
        body: BlocBuilder<BottomNavCubit, int>(
          builder: (context, selectedIndex) {
            return pages[selectedIndex];
          },
        ),
        bottomNavigationBar: MainBottomNavBar(),
      ),
    );
  }
}
