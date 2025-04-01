
import 'package:edu_project/core/constants/app_consts.dart';
import 'package:edu_project/presentation/widgets/my_button.dart';
import 'package:edu_project/quiz.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Savvolscreen extends StatelessWidget {
  const Savvolscreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> quizCategories = [
      {"title": "Vehicle Knowledge", "image": "assets/images/Group 162446.png"},
      {"title": "Environment", "image": "assets/images/Group 162446.png"},
      {"title": "Traffic Safety", "image": "assets/images/Group 162446.png"},
      {"title": "Traffic Rules", "image": "assets/images/Group 162446.png"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8E6),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF94D073)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Träningsprov",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFF94D073)),
            onPressed: () {
              showResultsDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: quizCategories.length,
          itemBuilder: (context, index) {
            return buildQuizCard(
              context,
              quizCategories[index]["title"]!,
              quizCategories[index]["image"]!,
            );
          },
        ),
      ),
    );
  }

  Widget buildQuizCard(BuildContext context, String title, String imagePath) {
    return InkWell(
      onTap: () {
        showResultsDialog(context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 16,
              bottom: 16,
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: InkWell(child: Image.asset('assets/images/Frame 19 (3).png',height: 50,width: 40,),onTap: () {
                showQuizSettingsDialogV2(context);
              },)
            ),
          ],
        ),
      ),
    );
  }

  void showResultsDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Your last 10 test results",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: [
              SizedBox(
                height: 200,
                width: 300,
                child: BarChart(
                  BarChartData(
                    barGroups: _generateBarData(),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              
              
              bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            return Text(
                              "${value.toInt() + 1}",
                              style: const TextStyle(fontSize: 12),
                            );
                          },
                        ),
                      ),
                    ),
                    gridData: FlGridData(show: false),
                  ),
                ),
              ),
        
           MyButton(title: "close", onPressed: Navigator.of(context).pop,),
            ],
          ),
        
          
        );
      },
    );
  }

  List<BarChartGroupData> _generateBarData() {
    List<double> results = [5, 8, 6, 9, 4, 7, 10, 6, 8, 9]; 

    return List.generate(results.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: results[index],
            width: 12,
            color: Colors.green,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    });
  }
}

void showQuizSettingsDialogV2(BuildContext context) {
  bool isQuizModeEnabled = false;
  bool isTimeEnabled = false;
  double numberOfQuestions = 20;

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Select number of questions",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: numberOfQuestions,
                        min: 5,
                        max: 50,
                        divisions: 9,
                        label: numberOfQuestions.toInt().toString(),
                        activeColor: Color(0xFF94D073),
                        onChanged: (value) {
                          setState(() {
                            numberOfQuestions = value;
                          });
                        },
                      ),
                    ),
                    Text(numberOfQuestions.toInt().toString()),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  "Choose quiz mode",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("All",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Switch(
                      value: isQuizModeEnabled,
                      activeColor: Color(0xFF94D073),
                      onChanged: (value) {
                        setState(() {
                          isQuizModeEnabled = value;
                        });
                      },
                    ),
                  ],
                ),
                if (!isQuizModeEnabled)
                  Slider(
                    value: numberOfQuestions,
                    min: 5,
                    max: 50,
                    divisions: 9,
                    activeColor: Color(0xFF94D073),
                    onChanged: (value) {
                      setState(() {
                        numberOfQuestions = value;
                      });
                    },
                  ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.access_time, color: Color(0xFF94D073)),
                        const SizedBox(width: 8),
                        const Text("Choose time"),
                      ],
                    ),
                    Switch(
                      value: isTimeEnabled,
                      activeColor: Color(0xFF94D073),
                      onChanged: (value) {
                        setState(() {
                          isTimeEnabled = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppConsts.primaryColor,
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppConsts.primaryColor,
                        minimumSize: Size(220, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => QuizScreen()),
                        );
                      },
                      child: Text("Start Quiz",style: TextStyle(fontSize: 16,color: Colors.white),),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
