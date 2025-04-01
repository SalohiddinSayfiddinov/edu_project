import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
 final String title; 
 final double fontSize;
 final FontWeight fontWeight;
 final Color color; 
  const MyText({super.key, required this.title,  this.fontSize=16,  this.fontWeight=FontWeight.w500,  this.color=Colors.black,});

  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(fontSize: fontSize,fontWeight:fontWeight,color:color  ),);
  }
}