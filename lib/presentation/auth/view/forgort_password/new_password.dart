import 'package:edu_project/presentation/auth/widgets/my_container.dart';
import 'package:edu_project/presentation/widgets/row_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_consts.dart';
import '../../../../core/constants/text_style.dart';
import '../../../widgets/my_button.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

bool _issuccess = true;

class _NewPasswordState extends State<NewPassword> {
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
                _issuccess
                    ? "Create New 🔑\nPassword"
                    : "Password Changed \nSuccessfully 🔑",
                style: CustomTextStyle.h1,
              ),
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                _issuccess
                    ? "Enter your new password below. Make sure it's \nstrong and secure to protect your account"
                    : 'Your password has been updated successfully.\nYou can now use your new password to log in.',
                style: CustomTextStyle.h3,
              ),
              Gap(40),
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
                  child: _issuccess
                      ? Column(
                          spacing: 15,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text("Create new password",
                                style: CustomTextStyle.h2),
                            MyContainer(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_outlined),
                                    label: Text("Password"),
                                    labelStyle: TextStyle(
                                        fontSize: 12, color: AppConsts.shadow),
                                    border: InputBorder.none),
                              ),
                            ),
                            MyContainer(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_outlined),
                                    label: Text("Re-Password"),
                                    labelStyle: TextStyle(
                                        fontSize: 12, color: AppConsts.shadow),
                                    border: InputBorder.none),
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
                                  style:
                                      TextStyle(color: AppConsts.primaryColor),
                                ),
                              ],
                            ),
                            Spacer(),
                            RowButton(
                                onPressedicon: () {},
                                onPressed: () {
                                  setState(() {
                                    _issuccess = false;
                                  });
                                },
                                title: "Set New Password")
                          ],
                        )
                      : Column(
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
                                      color: AppConsts.shadow
                                          .withValues(alpha: 0.3))
                                ], shape: BoxShape.circle, color: Colors.white),
                                child: CircleAvatar(
                                  radius: 55,
                                  backgroundColor: AppConsts.primaryColor
                                      .withValues(alpha: 0.3),
                                  child: SvgPicture.asset(
                                      "assets/icons/Vector.svg"),
                                )),
                            Text(
                              'Changed Successfully',
                              style: CustomTextStyle.h2,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Keep your new password safe and avoid sharing it with others.',
                              style: CustomTextStyle.h3,
                            ),
                            Spacer(),
                            MyButton(
                              title: "Login",
                              onPressed: () {
                                setState(() {
                                });
                              },
                            )
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
