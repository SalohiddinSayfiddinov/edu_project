import 'package:edu_project/core/constants/app_consts.dart';
import 'package:flutter/material.dart';

import 'my_container.dart';

class ChoosePackage extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final Color color;
  final Color color1;
  final Color color2;
  final VoidCallback onPressed;
  const ChoosePackage({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.onPressed,
    required this.color,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: MyContainer(
        color: color,
        h: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: color1,
              child: Icon(
                Icons.check,
                color: color2,
                size: 15,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    text1,
                    style: TextStyle(
                        fontSize: 12,
                        color: AppConsts.shadow,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: text2,
                      style: TextStyle(
                        color: AppConsts.textColor,
                        fontSize: 18,
                      )),
                  TextSpan(
                      text: text3,
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 18,
                      )),
                ])),
                Text(
                  "Everything included for $text4 days",
                  style: TextStyle(color: AppConsts.shadow, fontSize: 12),
                )
              ],
            ),
            Text(
              text5,
              style: TextStyle(color: AppConsts.primaryColor, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}