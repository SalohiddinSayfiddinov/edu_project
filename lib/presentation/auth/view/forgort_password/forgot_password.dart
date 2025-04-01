import 'package:edu_project/core/constants/app_consts.dart';
import 'package:edu_project/core/constants/text_style.dart';
import 'package:edu_project/presentation/auth/widgets/my_container.dart';
import 'package:edu_project/presentation/widgets/row_button.dart';
import 'package:flutter/material.dart';

import 'sms_verification.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emileController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color color = AppConsts.shadow;
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
                "Don’t Worry!",
                style: CustomTextStyle.h1,
              ),
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                "Easily reset your password \nbyentering email",
                style: CustomTextStyle.h3,
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Confirm your email",
                      style: CustomTextStyle.h2,
                    ),
                    Text(
                      "Enter the email associated with your account and we’ll send an email with code to reset your password.",
                      style: CustomTextStyle.h3,
                    ),
                    Form(
                      key: _formKey,
                      child: MyContainer(
                        child: TextFormField(
                          controller: emileController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.email_outlined, color: color),
                              label: Text("Email Address"),
                              labelStyle: TextStyle(color: color, fontSize: 12),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Spacer(),
                    RowButton(
                        color: emileController.text.isEmpty
                            ? AppConsts.buttonDisabledColor
                            : AppConsts.primaryColor,
                        onPressedicon: () {},
                        onPressed: () {
                          if (RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(emileController.text)) {
                            setState(() {
                              color = AppConsts.shadow;
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return SmsVerification();
                              },
                            ));
                          } else {
                            setState(() {
                              color = Colors.red;
                            });
                          }
                        },
                        title: "Conform"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
