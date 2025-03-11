import 'package:edu_project/core/constants/app_consts.dart';
import 'package:edu_project/presentation/auth/widgets/chek_text.dart';
import 'package:edu_project/presentation/auth/widgets/my_container.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

bool istoggle = true;
bool istoggle1 = false;
final GlobalKey _globalKey = GlobalKey();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: AppConsts.bgcolor,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/images/fon.png"))),
        child: SafeArea(
          child: Column(
            spacing: 10,
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  istoggle
                      ? "Hello There🖐,\nCreate your account"
                      : "Hey,\n welcome back!",
                  style: CustomTextStyle.h1,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    "Enter your details for email and password to access your account."),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  spacing: 25,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 30,
                                offset: Offset(0, 15),
                                spreadRadius: 0,
                                color: AppConsts.shadow.withValues(alpha: 0.3))
                          ],
                          color: AppConsts.buttonDisabledColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ToggleText(
                            color1: istoggle
                                ? AppConsts.primaryColor
                                : AppConsts.buttonDisabledColor,
                            color2: istoggle ? Colors.white : Colors.black,
                            title: "Register",
                            onPressed: () {
                              setState(() {
                                istoggle = !istoggle;
                                istoggle1 = false;
                              });
                            },
                          ),
                          ToggleText(
                            color1: istoggle1
                                ? AppConsts.primaryColor
                                : AppConsts.buttonDisabledColor,
                            color2: istoggle1 ? Colors.white : Colors.black,
                            title: "Login",
                            onPressed: () {
                              setState(() {
                                istoggle1 = !istoggle1;
                                istoggle = false;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Form(
                        key: _globalKey,
                        child: Column(
                          spacing: 15,
                          children: [
                            MyContainer(
                                child: TextFormField(
                                  decoration: InputDecoration(prefixIcon: Icon(Icons.person_outline_sharp),
                                      label: Text("Name"),
                                      labelStyle:
                                          TextStyle(color: AppConsts.shadow),
                                      border: InputBorder.none),
                                ),
                                onpressed: () {}),
                            MyContainer(
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                                onpressed: () {}),
                            MyContainer(
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                                onpressed: () {}),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
