import 'dart:async';

import 'package:edu_project/core/constants/text_style.dart';
import 'package:edu_project/presentation/auth/view/forgort_password/new_password.dart';
import 'package:edu_project/presentation/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/constants/app_consts.dart';

class SmsVerification extends StatefulWidget {
  const SmsVerification({super.key});

  @override
  State<SmsVerification> createState() => _SmsVerificationState();
}

class _SmsVerificationState extends State<SmsVerification> {
  TextEditingController? controller;

  Timer? timer;
  String currentTime = "(0:60)";

  FocusNode? focusNode;

  @override
  void initState() {
    controller = TextEditingController();
    startTimer();

    focusNode = FocusNode();
    focusNode!.requestFocus();
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 60) {
        timer.cancel();
      }
      setState(() {
        currentTime = '0:${60 - timer.tick}';
      });
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    timer!.cancel();
    focusNode!.dispose();
    super.dispose();
  }

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
              SizedBox(height: 60),
              Text(
                textAlign: TextAlign.center,
                "Instruction Sent to \nYour Email!",
                style: CustomTextStyle.h1,
              ),
              Gap(60),
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
                      SizedBox(height: 5),
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                blurRadius: 30,
                                offset: Offset(0, 15),
                                spreadRadius: 0,
                                color: AppConsts.shadow.withValues(alpha: 0.3))
                          ], shape: BoxShape.circle, color: Colors.white),
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor:
                                AppConsts.primaryColor.withValues(alpha: 0.3),
                            child: SvgPicture.asset("assets/icons/parol.svg"),
                          )),
                      Text(
                        'Enter the 6 digit code',
                        style: CustomTextStyle.h2,
                      ),
                      Text(
                        'Please confirm your account by entering the authorization code sen to wo******@gmail.com',
                        style: CustomTextStyle.h3,
                      ),
                      Pinput(
                        defaultPinTheme: PinTheme(
                            height: 34,
                            width: 34,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppConsts.shadow))),
                        length: 6,
                        onChanged: (value) {
                          print(value);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Resend code ",
                            style: TextStyle(
                                fontSize: 14,
                                color: currentTime == '0:0'
                                    ? AppConsts.primaryColor
                                    : AppConsts.textColor),
                          ),
                          Text(
                            currentTime == '0:0' ? "" : " $currentTime",
                            style: TextStyle(
                                color: currentTime == '0:0'
                                    ? AppConsts.primaryColor
                                    : AppConsts.textColor),
                          ),
                        ],
                      ),
                      Spacer(),
                      MyButton(title: "Resend Link", onPressed: () {Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return NewPassword();
                            },
                          ));})
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
