import 'package:edu_project/presentation/auth/widgets/my_container.dart';
import 'package:edu_project/presentation/widgets/row_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_consts.dart';
import '../../../../core/constants/text_style.dart';
import '../../widgets/my_button.dart';

class ProfileLogo extends StatefulWidget {
  const ProfileLogo({super.key});

  @override
  State<ProfileLogo> createState() => _ProfileLogoState();
}

bool _issuccess = true;

class _ProfileLogoState extends State<ProfileLogo> {
  List<String> images = [
    "assets/images/a1.png",
    "assets/images/a2.png",
    "assets/images/a3.png",
    "assets/images/a4.png",
    "assets/images/a4.png",
    "assets/images/a4.png",
  ];
  int currentIndex = 0;
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
                    ? "Hello There 🖐,\nCreate your account"
                    : "Grattis ditt\nkonto har skapats",
                style: CustomTextStyle.h1,
              ),
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                _issuccess
                    ? "Ange dina uppgifter för e-post och lösenord för\n att få tillgång till ditt konto."
                    : 'Fantastiskt! Du har nu skapat ditt konto. Vi ser \nfram emot att välkomna dig i vår gemenskap!',
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
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: AppConsts.primaryColor,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 58,
                                child: CircleAvatar(
                                  radius: 54,
                                  backgroundColor: AppConsts.primaryColor
                                      .withValues(alpha: 0.3),
                                  child: Image.asset(images[currentIndex],
                                      width: 100, fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Text(
                              "Ahmad",
                              style: CustomTextStyle.h2,
                            ),
                            Text(
                              "garokmusubi88@gmail.com",
                              style: CustomTextStyle.h3,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemExtent: 100,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: images.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          currentIndex = index;
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: currentIndex == index
                                            ? AppConsts.primaryColor
                                            : Colors.white,
                                        radius: 72,
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor:
                                              AppConsts.primaryColor,
                                          child: Image.asset(images[index],
                                              width: 70, fit: BoxFit.cover),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            Spacer(),
                            RowButton(
                                onPressedicon: () {},
                                onPressed: () {
                                  setState(() {
                                    _issuccess = false;
                                  });
                                },
                                title: "To my pages")
                          ],
                        )
                      : Column(
                          spacing: 15,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 5),
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: AppConsts.primaryColor,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 58,
                                child: CircleAvatar(
                                  radius: 54,
                                  backgroundColor: AppConsts.primaryColor
                                      .withValues(alpha: 0.3),
                                  child: Image.asset(images[currentIndex],
                                      width: 100, fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Text(
                              'Ahmad',
                              style: CustomTextStyle.h2,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Du kommer att flyttas till startskärmen\njust nu. Njut av funktionerna!',
                              style: CustomTextStyle.h3,
                            ),
                            Spacer(),
                            MyButton(
                              title: "To my pages",
                              onPressed: () {
                                setState(() {
                                  _issuccess = true;
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
