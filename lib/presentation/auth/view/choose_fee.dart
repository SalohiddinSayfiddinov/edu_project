import 'package:easy_stepper/easy_stepper.dart';
import 'package:edu_project/presentation/auth/widgets/payment_fee2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_consts.dart';
import '../../../core/constants/text_style.dart';
import '../widgets/payment_fee1.dart';

class ChooseFee extends StatefulWidget {
  const ChooseFee({super.key});

  @override
  State<ChooseFee> createState() => _ChooseFeeState();
}

class _ChooseFeeState extends State<ChooseFee> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      PaymentFee1(
        onPressed: () {
          setState(() {
            activeStep += 1;
          });
        },
        onPressedicon: () {},
        onTab: () {},
      ),
      PaymentFee2(),
      Center(
        child: Text("data"),
      ),
    ];
    return Scaffold(
      backgroundColor: AppConsts.bgcolor,
      body: Container(
        decoration: BoxDecoration(
            color: AppConsts.bgcolor,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/images/fon.png"))),
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 30),
            activeStep == 0
                ? Text(
                    textAlign: TextAlign.center,
                    "Your Driving License \nJourney Starts Here!",
                    style: CustomTextStyle.h1,
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: EasyStepper(
                showTitle: false,
                unreachedStepBorderType: BorderType.normal,
                disableScroll: true,
                showStepBorder: true,
                activeStepBorderType: BorderType.normal,
                activeStepIconColor: AppConsts.primaryColor,
                activeStep: activeStep,
                lineStyle: const LineStyle(
                  finishedLineColor: AppConsts.primaryColor,
                  defaultLineColor: AppConsts.grey,
                  lineLength: 80,
                  lineType: LineType.normal,
                  lineThickness: 2,
                  lineSpace: 1,
                  lineWidth: 10,
                  unreachedLineType: LineType.dashed,
                ),
                stepShape: StepShape.circle,
                stepBorderRadius: 20,
                borderThickness: 2,
                stepRadius: 20,
                activeStepBorderColor: AppConsts.primaryColor,
                activeStepBackgroundColor: AppConsts.primaryColor,
                finishedStepBackgroundColor: AppConsts.primaryColor,
                showLoadingAnimation: false,
                onStepReached: (index) => setState(() => activeStep = index),
                steps: [
                  EasyStep(
                      customStep: activeStep == 1
                          ? CircleAvatar(
                              radius: 12,
                              backgroundColor:
                                  AppConsts.primaryColor.withValues(alpha: 0.1),
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: AppConsts.primaryColor
                                    .withValues(alpha: 0.5),child: SvgPicture.asset("assets/icons/Group 18.svg",),
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor: const Color(0xfff4f4f4),
                              child: Opacity(
                                opacity: activeStep >= 0 ? 1 : 0.3,
                                child: SvgPicture.asset(
                                  "assets/icons/korzina.svg",
                                ),
                              ),
                            ),
                      topTitle: false),
                  EasyStep(
                      customStep: CircleAvatar(
                        backgroundColor: const Color(0xfff4f4f4),
                        child: Opacity(
                          opacity: activeStep >= 1 ? 1 : 0.3,
                          child: SvgPicture.asset(
                            "assets/icons/Group 162403.svg",
                            colorFilter: activeStep == 1
                                ? const ColorFilter.mode(
                                    Color(0xfff4f4f4), BlendMode.dst)
                                : ColorFilter.mode(
                                    const Color(0xfff4f4f4).withOpacity(0.7),
                                    BlendMode.difference),
                          ),
                        ),
                      ),
                      topTitle: false),
                  EasyStep(
                      customStep: CircleAvatar(
                        backgroundColor: const Color(0xfff4f4f4),
                        child: Opacity(
                          opacity: activeStep >= 2 ? 1 : 0.3,
                          child: SvgPicture.asset(
                            "assets/icons/check.svg",
                            colorFilter: activeStep == 2
                                ? const ColorFilter.mode(
                                    Color(0xfff4f4f4), BlendMode.dst)
                                : ColorFilter.mode(
                                    const Color(0xfff4f4f4).withOpacity(0.7),
                                    BlendMode.difference),
                          ),
                        ),
                      ),
                      topTitle: false),
                ],
              ),
            ),
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
                child: pages[activeStep],
              ),
            )
          ],
        )),
      ),
    );
  }
}





