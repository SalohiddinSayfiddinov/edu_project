import 'package:edu_project/screens/book_audio.dart';
import 'package:edu_project/widgets/checkBoxContainer.dart';
import 'package:edu_project/widgets/my_text.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

class MyBook extends StatefulWidget {
  const MyBook({super.key});

  @override
  State<MyBook> createState() => _MyBookState();
}

class _MyBookState extends State<MyBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 29, right: 29, top: 20),
          child: Column(
            children: [
              MyText(title: "The Driving License Book"),
              Gap(30),
              MyRow(
                image: Image.asset("assets/images/Vector (1).png"),
                myText: MyText(title: "Fordonskännedom"),
              ),
              Gap(8),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CheckBoxContainer(title: "Däckbyte");
                  },
                  separatorBuilder: (context, index) {
                    return Gap(8);
                  },
                  itemCount: 7,
                ),
              ),
              Gap(12),
              MyRow(
                image: Image.asset("assets/images/Vector (1).png"),
                myText: MyText(title: "Fordonskännedom"),
              ),
              Gap(8),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CheckBoxContainer(title: "Däckbyte");
                  },
                  separatorBuilder: (context, index) {
                    return Gap(8);
                  },
                  itemCount: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
