import 'package:flutter/material.dart';

class Todolistscreen extends StatelessWidget {
  Todolistscreen({super.key});

  final List<Map<String, String>> items = [
    {"image": "assets/images/d1-1 1.png", "title": "körkortstillstånd"},
    {"image": "assets/images/b2-1 1.png", "title": "Introduktionsutbildning"},
    {"image": "assets/images/i1-1 1.png", "title": "Börja övningsköra"},
    {"image": "assets/images/e7-1 1 (1).png", "title": "Riskutbildningen"},
    {"image": "assets/images/a1-1 1.png", "title": "Teoriprov"},
    {"image": "assets/images/e7-1 2.png", "title": "Riskutbildningarna 2"},
    {"image": "assets/images/d1-1 1 (1).png", "title": "körkortstillstånd"},
    {"image": "assets/images/b2-1 1 (1).png", "title": "Introduktionsutbildning"},
    {"image": "assets/images/i1-1 1.png", "title": "Börja övningsköra"},
    {"image": "assets/images/e7-1 1 (1).png", "title": "Riskutbildningen"},
    {"image": "assets/images/a1-1 1.png", "title": "Teoriprov"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E6),
      appBar: AppBar(
        title: Text(
          "Road markings",
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
     backgroundColor: Color(0xFFFFF8E6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                leading: Image.asset(
                  items[index]["image"]!,
                  width: 30, 
                  height: 30,
                  fit: BoxFit.contain,
                ),
                title: Text(items[index]["title"]!),
                trailing: Icon(Icons.arrow_forward_ios, size: 16,color: Color(0xFF777777),
                ),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}