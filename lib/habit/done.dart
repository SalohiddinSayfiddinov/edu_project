import 'package:edu_project/habit/home.dart';
import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/images/Calendar_Flatline 1.png'),
          ),
          SizedBox(
            height: 200,
          ),
          Text(
            'New Habit Goal has added Let’s do the best to achieve your goal!',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
          ),InkWell(
      onTap: () {
      Navigator.push(
            context, MaterialPageRoute(builder: (_) => HabitTracker())); 
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
        ),
        child: Text(
          'Done',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    )
        ],
      ),
    );
  }
}
