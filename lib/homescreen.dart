import 'package:edu_project/homehabi.dart';
import 'package:flutter/material.dart';
import 'package:edu_project/quiz.dart';
import 'package:edu_project/tr%C3%A4ningsprov.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomehabiScreen(),
    const Homescreen(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E6),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _selectedIndex == 0 ? Colors.green : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task,
                color: _selectedIndex == 1 ? Colors.green : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book,
                color: _selectedIndex == 2 ? Colors.green : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified,
                color: _selectedIndex == 3 ? Colors.green : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _selectedIndex == 4 ? Colors.green : Colors.grey),
            label: '',
          ),
        ],
      ),
    );
  }
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            buildPracticePath(context),
            const SizedBox(height: 16),
            _buildPracticeModes(),
               const SizedBox(height: 16),
            _buildContainermodes(
              'assets/images/Frame 19.png', // imagePat
              'Custom practice tests',            // title
              'Set category, time, and level',         // subtitle
                  // countBgColor
          null   ,  
          null,   
            )
            ,SizedBox(height: 8),
            _buildContainermodes(
              'assets/images/Frame 19.png', // imagePat
              'Custom practice tests',            // title
              'Set category, time, and level',         // subtitle
                   // iconBgColor
                // countBgColor
          null   ,  
          null,   
            ),
            SizedBox(height: 8),
            _buildContainermodes(
              'assets/images/Frame 19.png', // imagePat
              'Custom practice tests',            // title
              'Set category, time, and level',         // subtitle
                   // iconBgColor
                // countBgColor
          null   ,  
          null,   
            ),
            SizedBox(height: 8),
            _buildContainermodes(
              'assets/images/Frame 19.png', // imagePat
              'Custom practice tests',            // title
              'Set category, time, and level',         // subtitle
                   // iconBgColor
           
          null   ,  
          null,   
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
  color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/Display Picture.png'),
            ],
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Username",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              LinearPercentIndicator(
                width: 100,
                lineHeight: 8,
                percent: 0.6,
                progressColor: Colors.green,
                backgroundColor: Colors.green[100],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPracticePath(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Practice Path",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Savvolscreen()));
              },
              child: const Text("See All",
                  style: TextStyle(color: Color(0xFF94D073))),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              practiceCard(context, "Vehicle Knowledge", 0.85),
            practiceCard(context, "Traffic Rules", 0.72),
              practiceCard(context, "Environment", 0.60),
            ],
          ),
        ),
      ],
    );
  }

  Widget practiceCard(BuildContext context, String title, double progress) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => QuizScreen()));
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: AssetImage("assets/images/Group 162446.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildPracticeModes(
   ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Practice Modes",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
     ],
      );
  }
}
 Widget _buildContainermodes(String imagePat,String title, String subtitle, Color? countBgColor, int? count){
  return Container(height: 95,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
        Container(
    decoration: BoxDecoration(
        
              borderRadius: BorderRadius.circular(18),
            ),
       
            child: Image.asset(
              imagePat,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
          if (count != null && countBgColor != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: countBgColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(count.toString(), style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
        ],
      ),
    );
  }

