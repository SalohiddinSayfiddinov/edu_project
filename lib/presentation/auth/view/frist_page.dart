import 'package:edu_project/core/constants/app_consts.dart';
import 'package:edu_project/presentation/auth/view/on_boarding_page.dart';
import 'package:flag/flag_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/text_style.dart';
import '../../widgets/my_button.dart';
import '../widgets/check_language.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

bool toogle1 = false;
bool toogle2 = false;
bool toogle3 = false;
Set<String> languages = {};

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    languages.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConsts.bgcolor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/images/fon.png"))),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 90),
              SvgPicture.asset("assets/icons/Logo.svg"),
              Text("Edu Project", style: CustomTextStyle.h1),
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
                  spacing: 10,
                  children: [
                    Text(
                      "Select Your\nPreferred Language",
                      style: CustomTextStyle.h1,
                      textAlign: TextAlign.start,
                    ),
                    ChekLan(
                      text2: ' Uzbek Tili',
                      code: FlagsCode.UZ,
                      onpressed: () {
                        setState(() {
                          toogle1 = !toogle1;
                          languages.add('uz');
                          languages.remove('eng');
                          languages.remove('ru');
                          toogle2 = false;
                          toogle3 = false;
                        });
                      },
                      color:
                          toogle1 ? AppConsts.primaryColor : Colors.transparent,
                    ),
                    ChekLan(
                      text2: 'Руский Язик',
                      code: FlagsCode.RU,
                      onpressed: () {
                        setState(() {
                          toogle2 = !toogle2;
                          languages.add('ru');
                          languages.remove('eng');
                          languages.remove('uz');
                          toogle1 = false;
                          toogle3 = false;
                        });
                      },
                      color:
                          toogle2 ? AppConsts.primaryColor : Colors.transparent,
                    ),
                    ChekLan(
                      text2: 'English Language',
                      code: FlagsCode.GB,
                      onpressed: () {
                        setState(() {
                          toogle3 = !toogle3;
                          languages.add('eng');
                          languages.remove('ru');
                          languages.remove('uz');
                          toogle1 = false;
                          toogle2 = false;
                        });
                      },
                      color:
                          toogle3 ? AppConsts.primaryColor : Colors.transparent,
                    ),
                    Spacer(),
                    MyButton(
                      color: _get()
                          ? AppConsts.buttonDisabledColor
                          : AppConsts.primaryColor,
                      textColor: _get() ? Colors.black : Colors.white,
                      title: 'Select',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OnBoardingPage()));
                      },
                    ),
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

bool _get() {
  if (languages.isNotEmpty) {
    return false;
  }
  return true;
}
