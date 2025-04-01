
import 'package:edu_project/habit/done.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HabitTracker extends StatefulWidget {
  const HabitTracker({super.key});

  @override
  _HabitTrackerState createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  List<Habit> habits = [
    Habit('Meditating', false),
    Habit('Read Philosophy', false),
    Habit('Journaling', false),
  ];

  List<Goal> goals = [
    Goal('Finish 5 Philosophy Books', 0.5),
    Goal('Sleep before 11 pm', 0.3),
    Goal('Finish reading The Hobbit', 0.2),
  ];

  void _showAddHabitDialog() {
    String habitName = '';
    String selectedPeriod = '1 Month (30 Days)';
    String selectedHabitType = 'Everyday';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Text("Create New Habit Goal"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Your Goal", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              TextField(
                onChanged: (value) {
                  habitName = value;
                },
                decoration: const InputDecoration(hintText: "Habit Name"),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Period", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DropdownButtonFormField<String>(
                value: selectedPeriod,
                items: ['1 Month (30 Days)', '3 Months (90 Days)', '6 Months (180 Days)']
                    .map((String value) => DropdownMenuItem(value: value, child: Text(value)))
                    .toList(),
                onChanged: (newValue) {
                  selectedPeriod = newValue!;
                },
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Habit Type", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DropdownButtonFormField<String>(
                value: selectedHabitType,
                items: ['Everyday', '3 Times a Week', 'Once a Week']
                    .map((String value) => DropdownMenuItem(value: value, child: Text(value)))
                    .toList(),
                onChanged: (newValue) {
                  selectedHabitType = newValue!;
                },
              ),
            ],
          ), 
                
    actions: [
      InkWell(
        onTap: () {
          if (habitName.isNotEmpty) {
            setState(() {
              goals.add(Goal(habitName, 0.0));
            });
            Navigator.pop(context);
          }
          Navigator.push(context, MaterialPageRoute(builder: (_) => DoneScreen()));
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Create New',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sun, 1 March 2022', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        backgroundColor: const Color(0xFFEDEDED),

),
      backgroundColor: const Color(0xFFEDEDED),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Hello, Susy!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            ),
            child: Row(
              children: [
                CircularPercentIndicator(
                  radius: 50.0,
                  lineWidth: 8.0,
                  percent: 0.7,
                  center: const Text('70%', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  progressColor: Colors.white,
                  backgroundColor: Colors.orangeAccent,
                ),
                const SizedBox(width: 16),
                const Text('3 of 5 habits completed today!', style: TextStyle(color: Colors.white, fontSize: 16)),
                const Spacer(),
                Image.asset('assets/images/Calendar_Flatline 1.png'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text('Today Habit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Column(
                  children: habits.map((habit) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          habit.isChecked = !habit.isChecked;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: habit.isChecked ? Colors.green[100] : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: habit.isChecked ? Colors.green : Colors.grey[300]!),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              habit.name,
                              style: TextStyle(
                                fontSize: 16,
                                color: habit.isChecked ? Colors.green : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Checkbox(
                              value: habit.isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  habit.isChecked = value!;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                const Text('Your Goals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),


const SizedBox(height: 10),
                Column(children: goals.map((goal) => goalProgress(goal.name, goal.progress)).toList()),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddHabitDialog,
        backgroundColor: Colors.green,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }

  Widget goalProgress(String title, double progress) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          LinearProgressIndicator(value: progress, backgroundColor: Colors.grey[300], color: Colors.orange, minHeight: 8),
        ],
      ),
    );
  }
}

class Habit {
  String name;
  bool isChecked;
  Habit(this.name, this.isChecked);
}

class Goal {
  String name;
  double progress;
  Goal(this.name, this.progress);
}