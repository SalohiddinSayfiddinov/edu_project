import 'package:edu_project/widgets/my_text.dart';
import 'package:flutter/material.dart';


class CheckBoxContainer extends StatefulWidget {
  final String title;

  const CheckBoxContainer({super.key, required this.title});

  @override
  _CheckBoxContainerState createState() => _CheckBoxContainerState();
}

class _CheckBoxContainerState extends State<CheckBoxContainer> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
        child: Row(
          children: [
            MyText(fontSize: 12, title: widget.title, color: Color(0xff5A6981)),
            Spacer(),
            ClipOval(
              child: Container(
                decoration: BoxDecoration(
                  color: isChecked ? Colors.green : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                width: 20,
                height: 20,
                child: Checkbox(
                  side: BorderSide(color: Colors.transparent),
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue ?? false;
                    });
                  },
                  fillColor: MaterialStateProperty.all(Colors.transparent),
                  checkColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
