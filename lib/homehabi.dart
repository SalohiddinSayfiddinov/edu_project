   
import 'package:flutter/material.dart';



class HomehabiScreen extends StatelessWidget {
const HomehabiScreen ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/Display Picture.png'), 
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Oybek', style: TextStyle(color: Colors.black)),
                SizedBox(height: 2),
               
              ],
            ),
          
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Träningsprov', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Image.asset('assets/images/Group 162529.png');
                },
              ),
            ),
          ],
        ),
      ),
     
    );
  }
}