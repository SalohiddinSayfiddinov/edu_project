import 'package:edu_project/core/constants/app_consts.dart';
import 'package:flutter/material.dart';

class Todolistscreen extends StatelessWidget {
  Todolistscreen({super.key});

  final List<Map<String, String>> items = [
    {
      "image": "assets/images/d1-1 1.png",
      "title": "körkortstillstånd",
      'description':
          "Körkortstillstånd är ett tillstånd som du måste ha för att få börja övningsköra. Du kan ansöka om körkortstillstånd när du är 16 år. Du kan ansöka om körkortstillstånd hos Transportstyrelsen. När du har ansökt om körkortstillstånd får du ett tillfälligt körkortstillstånd som du kan använda för att börja övningsköra. När du har övningskört i minst 6 månader kan du ansöka om ett fast körkortstillstånd."
    },
    {
      "image": "assets/images/b2-1 1.png",
      "title": "Introduktionsutbildning",
      'description':
          "Introduktionsutbildning är en del av körkortsutbildningen. Utbildningen består av två delar, del ett är en teoridel och del två är en praktisk del. Du kan genomföra delarna i vilken ordning du vill. Du kan genomföra introduktionsutbildningen hos en trafikskola eller på egen hand."
    },
    {
      "image": "assets/images/i1-1 1.png",
      "title": "Börja övningsköra",
      'description':
          "Börja övningsköra är en del av körkortsutbildningen. Du kan börja övningsköra när du har körkortstillstånd och har genomfört introduktionsutbildningen. Du kan övningsköra med en handledare som är minst 24 år och har haft körkort i minst 5 år. Du kan övningsköra i 2 år innan du måste ta körkort."
    },
    {
      "image": "assets/images/e7-1 1 (1).png",
      "title": "Riskutbildningen",
      'description':
          "Riskutbildningen är en utbildning som du måste genomföra för att få körkort. Utbildningen består av två delar, del ett är en teoridel och del två är en praktisk del. Du kan genomföra delarna i vilken ordning du vill."
    },
    {
      "image": "assets/images/a1-1 1.png",
      "title": "Teoriprov",
      'description':
          "Teoriprov är ett prov som du måste klara för att få körkortstillstånd. Provet består av 65 frågor och du måste ha minst 52 rätt för att bli godkänd. Du kan göra provet på flera språk och det finns möjlighet att få extra tid om du behöver det."
    },
    {
      "image": "assets/images/e7-1 2.png",
      "title": "Riskutbildningarna 2",
      'description':
          "Riskutbildningarna är en del av körkortsutbildningen. Utbildningen består av två delar, del ett är en teoridel och del två är en praktisk del. Du kan genomföra delarna i vilken ordning du vill. Du kan genomföra riskutbildningarna hos en trafikskola eller på egen hand."
    },
    {
      "image": "assets/images/d1-1 1 (1).png",
      "title": "körkortstillstånd",
      'description':
          "Körkortstillstånd är ett tillstånd som du måste ha för att få börja övningsköra. Du kan ansöka om körkortstillstånd när du är 16 år. Du kan ansöka om körkortstillstånd hos Transportstyrelsen. När du har ansökt om körkortstillstånd får du ett tillfälligt körkortstillstånd som du kan använda för att börja övningsköra. När du har övningskört i minst 6 månader kan du ansöka om ett fast körkortstillstånd."
    },
    {
      "image": "assets/images/b2-1 1 (1).png",
      "title": "Introduktionsutbildning",
      'description':
          "Introduktionsutbildning är en del av körkortsutbildningen. Utbildningen består av två delar, del ett är en teoridel och del två är en praktisk del. Du kan genomföra delarna i vilken ordning du vill. Du kan genomföra introduktionsutbildningen hos en trafikskola eller på egen hand."
    },
    {
      "image": "assets/images/i1-1 1.png",
      "title": "Börja övningsköra",
      'description':
          "Börja övningsköra är en del av körkortsutbildningen. Du kan börja övningsköra när du har körkortstillstånd och har genomfört introduktionsutbildningen. Du kan övningsköra med en handledare som är minst 24 år och har haft körkort i minst 5 år. Du kan övningsköra i 2 år innan du måste ta körkort."
    },
    {
      "image": "assets/images/e7-1 1 (1).png",
      "title": "Riskutbildningen",
      'description':
          "Riskutbildningen är en utbildning som du måste genomföra för att få körkort. Utbildningen består av två delar, del ett är en teoridel och del två är en praktisk del. Du kan genomföra delarna i vilken ordning du vill."
    },
    {
      "image": "assets/images/b2-1 1 (1).png",
      "title": "Introduktionsutbildning",
      'description':
          "Introduktionsutbildning är en del av körkortsutbildningen. Utbildningen består av två delar, del ett är en teoridel och del två är en praktisk del. Du kan genomföra delarna i vilken ordning du vill. Du kan genomföra introduktionsutbildningen hos en trafikskola eller på egen hand."
    },
    {
      "image": "assets/images/i1-1 1.png",
      "title": "Börja övningsköra",
      'description':
          "Börja övningsköra är en del av körkortsutbildningen. Du kan börja övningsköra när du har körkortstillstånd och har genomfört introduktionsutbildningen. Du kan övningsköra med en handledare som är minst 24 år och har haft körkort i minst 5 år. Du kan övningsköra i 2 år innan du måste ta körkort."
    },
    {
      "image": "assets/images/e7-1 1 (1).png",
      "title": "Riskutbildningen",
      "description":
          "Riskutbildningen är en utbildning som du måste genomföra för att få körkort. Utbildningen består av två delar, del ett är en teoridel och del två är en praktisk del. Du kan genomföra delarna i vilken ordning du vill"
    },
    {
      "image": "assets/images/a1-1 1.png",
      "title": "Teoriprov",
      "description":
          "Teoriprov är ett prov som du måste klara för att få körkortstillstånd. Provet består av 65 frågor och du måste ha minst 52 rätt för att bli godkänd. Du kan göra provet på flera språk och det finns möjlighet att få extra tid om du behöver det."
    },
  ];

  void _showBottomSheet(BuildContext context, String imagePath, String title,
      String description) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imagePath,
                  width: 100, height: 100, fit: BoxFit.contain),
              SizedBox(height: 10),
              Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 10),
              Text(description, textAlign: TextAlign.center),
              SizedBox(height: 10),
              SizedBox(height: 50,width: 327,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConsts.primaryColor,padding: EdgeInsets.all(10)
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Close",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E6),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_outlined),
        ),
        title: Text(
          "Road markings",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFF777777),
                ),
                onTap: () {
                  _showBottomSheet(
                    context,
                    items[index]["image"]!,
                    items[index]["title"]!,
                    items[index]["description"]!,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
