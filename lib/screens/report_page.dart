import 'package:edu_project/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReportBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List icons = [
      Icons.title,
      Icons.help_outline,
      Icons.picture_in_picture_alt_sharp,
      Icons.message_outlined,
      Icons.error_outline
    ];
    List texts = [
      "Typo",
      "Don't understand",
      "Image & video",
      "Factual error",
      "Other"
    ];
    List descriptions = [
      "One or more typos",
      "Unclear question",
      "Media is unclear or wrong",
      "The facts don't add up",
      "For other feedback"
    ];

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(10),
          MyText(
            title: "Report",
            fontSize: 22,
          ),
          Gap(14),
          Column(
            children: [
              Container(
                color: Color(0xffF9FAFB),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Column(
                  children: List.generate(icons.length, (index) {
                    return MyRow2(
                      icon: Icon(icons[index], size: 20),
                      text: texts[index],
                      description: descriptions[index],
                    );
                  }),
                ),
              ),
              Gap(20),
             TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF2F3F7),
                    hintText: "Optional message (max. 120 characters)",
                    hintStyle: TextStyle(color: Color(0xffF9FAFB),),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white), 
                    ),
                   focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white), 
                    ),
                  ),
                ),
                Gap(20),
            ],
          ),
        ],
      ),
    );
  }
}

class MyRow2 extends StatelessWidget {
  final Icon icon;
  final String text;
  final String description;

  const MyRow2({super.key, required this.icon, required this.text, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          icon,
          Gap(6),
          MyText(
            title: text,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          Gap(8),
          Expanded(
            child: MyText(
              title: description,
              fontSize: 12,
              color: Color(0xffA0A9B4),
            ),
          ),
        ],
      ),
    );
  }
}
