import 'package:flutter/material.dart';

import '../../core/constants/app_consts.dart';
class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  const MyButton({
    super.key,
    required this.title,
    required this.onPressed, this.color, this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          backgroundColor:color?? AppConsts.primaryColor,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color:textColor?? Colors.white, fontSize: 16),
        ));
  }
}
