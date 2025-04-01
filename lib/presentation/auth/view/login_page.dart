import 'package:edu_project/core/constants/app_consts.dart';
import 'package:edu_project/presentation/auth/view/forgort_password/forgot_password.dart';
import 'package:edu_project/presentation/auth/view/profil_logo.dart';
import 'package:edu_project/presentation/auth/widgets/check_text.dart';
import 'package:edu_project/presentation/auth/widgets/my_container.dart';
import 'package:edu_project/presentation/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../core/constants/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

bool istoggle = true;
bool istoggle1 = false;
bool isobscureText = true;
final GlobalKey _globalKey = GlobalKey();
final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController emailController2 = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController passwordController2 = TextEditingController();
final TextEditingController repasswordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 15,
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
                    istoggle
                        ? Form(
                            key: _globalKey,
                            child: Column(
                              spacing: 15,
                              children: [
                                MyContainer(
                                  child: TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.person_outline_sharp,color: AppConsts.shadow,),
                                        label: Text("Name"),
                                        labelStyle: TextStyle(
                                            color: AppConsts.shadow,
                                            fontSize: 12),
                                        border: InputBorder.none),
                                  ),
                                ),
                                MyContainer(
                                  child: TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email_outlined,color: AppConsts.shadow,),
                                        label: Text("Email Address"),
                                        labelStyle: TextStyle(
                                            color: AppConsts.shadow,
                                            fontSize: 12),
                                        border: InputBorder.none),
                                  ),
                                ),
                                MyContainer(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width: 125,
                                        child: TextFormField(
                                          controller: passwordController,
                                          decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.lock_outlined,
                                                      color: AppConsts.shadow,),
                                              label: Text("Password"),
                                              labelStyle: TextStyle(
                                                  fontSize: 12,
                                                  color: AppConsts.shadow),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      SizedBox(
                                          height: 35,
                                          child: VerticalDivider(
                                            color: AppConsts.shadow,
                                          )),
                                      SizedBox(
                                        height: 60,
                                        width: 125,
                                        child: TextFormField(
                                          controller: repasswordController,
                                          obscureText: isobscureText,
                                          decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  isobscureText =
                                                      !isobscureText;
                                                  setState(() {});
                                                },
                                                icon: SvgPicture.asset(
                                                    isobscureText
                                                        ? "assets/icons/eye.svg"
                                                        : "assets/icons/eyes_remove.svg",
                                                    ),
                                              ),
                                              label: Text("Re-Password"),
                                              labelStyle: TextStyle(
                                                  fontSize: 12,
                                                  color: AppConsts.shadow),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  spacing: 10,
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      color: AppConsts.primaryColor,
                                    ),
                                    Text(
                                      "Minst 8 tecken",
                                      style: TextStyle(
                                          color: AppConsts.primaryColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Form(
                            key: _globalKey,
                            child: Column(
                              spacing: 15,
                              children: [
                                MyContainer(
                                  child: TextFormField(
                                    controller: emailController2,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email_outlined,color: AppConsts.grey,),
                                        label: Text("Email Address"),
                                        labelStyle: TextStyle(
                                            color: AppConsts.shadow,
                                            fontSize: 12),
                                        border: InputBorder.none),
                                  ),
                                ),
                                MyContainer(
                                  child: TextFormField(
                                    controller: passwordController2,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.lock_outline_rounded,color: AppConsts.grey,),
                                        label: Text("Password"),
                                        labelStyle: TextStyle(
                                            color: AppConsts.shadow,
                                            fontSize: 12),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotPassword()));
                                      },
                                      child: Text(
                                        "Forgot Password ?",
                                        style: TextStyle(
                                            color: AppConsts.primaryColor),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                    Column(
                      spacing: 15,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text("Or sign in with"),
                            ),
                            Expanded(child: Divider())
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: AppConsts.shadow)),
                              child: Brand(
                                Brands.google,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: AppConsts.shadow)),
                              child: Brand(Brands.apple_logo),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: AppConsts.shadow)),
                              child: Brand(Brands.facebook),
                            )
                          ],
                        ),
                      ],
                    ),
                    istoggle
                        ? MyButton(
                            title: "Register",
                            color: nameController.text.isEmpty &&
                                    emailController.text.isEmpty &&
                                    passwordController.text.isEmpty &&
                                    repasswordController.text.isEmpty
                                ? AppConsts.buttonDisabledColor
                                : AppConsts.primaryColor,
                            onPressed: () {
                              if (nameController.text.isNotEmpty &&
                                  emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty &&
                                  repasswordController.text.isNotEmpty) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProfileLogo()));
                              }
                            })
                        : MyButton(title: "Login", onPressed: () {})
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
