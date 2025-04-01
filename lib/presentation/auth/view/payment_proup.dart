import 'package:edu_project/presentation/widgets/row_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_consts.dart';
import '../../../core/constants/text_style.dart';

class PaymentProup extends StatefulWidget {
  const PaymentProup({super.key});

  @override
  State<PaymentProup> createState() => _PaymentProupState();
}

class _PaymentProupState extends State<PaymentProup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppConsts.bgcolor,
      body: Container(
        decoration: BoxDecoration(
            color: AppConsts.bgcolor,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/images/fon.png"))),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                "Take Your Driver's License to the Next Level!",
                style: CustomTextStyle.h1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  textAlign: TextAlign.center,
                  "Our courses offer benefits that transform your learning experience. Your journey to a driver's license has never been easier!",
                  style: CustomTextStyle.h3,
                ),
              ),
              Gap(20),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RowText(
                          text:
                              "Get access to 1500? driving license \nquestions"),
                      RowText(
                          text: "Learn theory with our instructional videos"),
                      RowText(text: "Listen to our audiobook wherever you are"),
                      RowText(text: "Recommended by driving schools"),
                      RowText(text: "Tillgång till vår webbsida och mobilapp"),
                      RowText(text: "Available in 15 Different Languages"),
                      RowText(text: "Become a safe driver"),
                      RowText(
                          text:
                              "Save money by passing the exam on the \nfirst try"),
                      SizedBox(height: 10),
                      Text(
                        "Get Access From Just 99 kr",
                        style: CustomTextStyle.h2,
                      ),
                      Spacer(),
                      RowButton(
                          onPressedicon: () {},
                          onPressed: () {},
                          title: "Drive forward to the checkout!")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  final String text;
  const RowText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        SvgPicture.asset("assets/icons/Group 18.svg"),
        Text(
          text,
          style: CustomTextStyle.h3,
        )
      ],
    );
  }
}
