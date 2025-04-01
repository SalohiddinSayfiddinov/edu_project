import 'package:dotted_border/dotted_border.dart';
import 'package:edu_project/core/constants/text_style.dart';
import 'package:edu_project/presentation/auth/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_consts.dart';
import '../../widgets/row_button.dart';
import 'check_text2.dart';
import 'choose_package.dart';

class PaymentFee1 extends StatefulWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onPressedicon;
  final VoidCallback? onTab;
  const PaymentFee1({
    super.key,
    this.onPressed,
    this.onTab,
    this.onPressedicon,
  });

  @override
  State<PaymentFee1> createState() => _PaymentFee1State();
}

bool istoggle = false;
bool istoggle1 = true;
bool ischecked0 = false;
bool ischecked1 = false;
bool ischecked2 = false;
bool ischecked3 = false;

class _PaymentFee1State extends State<PaymentFee1> {
  void sowDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Color(0xffffffff),
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return CuponDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Choose package",
              style: TextStyle(color: AppConsts.textColor, fontSize: 16),
            ),
            Container(
              height: 30,
              decoration: BoxDecoration(
                  color: AppConsts.buttonDisabledColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ToggleText1(
                    color1: istoggle
                        ? AppConsts.primaryColor
                        : AppConsts.buttonDisabledColor,
                    color2: istoggle ? Colors.white : Colors.black,
                    title: "Cupons",
                    onPressed: () {
                      sowDialog(context);
                      setState(() {
                        istoggle = !istoggle;
                        istoggle1 = false;
                      });
                    },
                  ),
                  ToggleText1(
                    color1: istoggle1
                        ? AppConsts.primaryColor
                        : AppConsts.buttonDisabledColor,
                    color2: istoggle1 ? Colors.white : Colors.black,
                    title: "Balans",
                    onPressed: () {
                      setState(() {
                        istoggle1 = !istoggle1;
                        istoggle = false;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 5),
        ChoosePackage(
          color: ischecked0 ? AppConsts.primaryColor : Colors.transparent,
          text1: "99",
          text2: "0kr/",
          text3: "7 days",
          text4: '7',
          text5: "-50%",
          onPressed: () {
            setState(() {
              ischecked0 = !ischecked0;
              ischecked1 = false;
              ischecked2 = false;
              ischecked3 = false;
            });
          },
          color1: ischecked0
              ? AppConsts.primaryColor.withValues(alpha: .3)
              : AppConsts.buttonDisabledColor,
          color2: ischecked0 ? AppConsts.primaryColor : AppConsts.shadow,
        ),
        ChoosePackage(
          color: ischecked1 ? AppConsts.primaryColor : Colors.transparent,
          text1: "399",
          text2: "69kr/",
          text3: "30 days",
          text4: '30',
          text5: "-130kr",
          onPressed: () {
            setState(() {
              ischecked1 = !ischecked1;
              ischecked0 = false;
              ischecked2 = false;
              ischecked3 = false;
            });
          },
          color1: ischecked1
              ? AppConsts.primaryColor.withValues(alpha: .3)
              : AppConsts.buttonDisabledColor,
          color2: ischecked1 ? AppConsts.primaryColor : AppConsts.shadow,
        ),
        ChoosePackage(
          color: ischecked2 ? AppConsts.primaryColor : Colors.transparent,
          text1: "399",
          text2: "269kr/",
          text3: "60 days",
          text4: '60',
          text5: "-130kr",
          onPressed: () {
            setState(() {
              ischecked2 = !ischecked2;
              ischecked0 = false;
              ischecked1 = false;
              ischecked3 = false;
            });
          },
          color1: ischecked2
              ? AppConsts.primaryColor.withValues(alpha: .3)
              : AppConsts.buttonDisabledColor,
          color2: ischecked2 ? AppConsts.primaryColor : AppConsts.shadow,
        ),
        ChoosePackage(
          color: ischecked3 ? AppConsts.primaryColor : Colors.transparent,
          text1: "549",
          text2: "419kr/",
          text3: "100 days",
          text4: '100',
          text5: "-130kr",
          onPressed: () {
            setState(() {
              ischecked3 = !ischecked3;
              ischecked0 = false;
              ischecked1 = false;
              ischecked2 = false;
            });
          },
          color1: ischecked3
              ? AppConsts.primaryColor.withValues(alpha: .3)
              : AppConsts.buttonDisabledColor,
          color2: ischecked3 ? AppConsts.primaryColor : AppConsts.shadow,
        ),
        SizedBox(height: 5),
        RowButton(
            onPressedicon: widget.onPressedicon ?? () {},
            onPressed: widget.onPressed ?? () {},
            title: "Drive Forward to the Checkout!"),
        InkWell(
          onTap: widget.onTab,
          child: Text(
            "Integritetspolicy & Användarvillkor",
            style: TextStyle(
              color: AppConsts.shadow,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class CuponDialog extends StatefulWidget {
  const CuponDialog({super.key});

  @override
  State<CuponDialog> createState() => _CuponDialogState();
}

class _CuponDialogState extends State<CuponDialog> {
  void sowDialog2(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Color(0xffffffff),
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return CuponDialog2();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .66,
      child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 10,
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor:
                        AppConsts.primaryColor.withValues(alpha: 0.3),
                    child:
                        SvgPicture.asset("assets/icons/Ticket.svg", width: 50),
                  ),
                  Text(
                    "Enter your code",
                    style: CustomTextStyle.h2,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppConsts.buttonDisabledColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppConsts.shadow),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 30,
                            offset: Offset(0, 15),
                            spreadRadius: 0,
                            color: AppConsts.shadow.withValues(alpha: 0.3))
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Enter your code here',
                                hintStyle: TextStyle(
                                    color: AppConsts.shadow, fontSize: 12),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          decoration: BoxDecoration(
                              color: AppConsts.primaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            "Apply",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 20,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      sowDialog2(context);
                    },
                    child: Container(
                      height: 60,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppConsts.buttonDisabledColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppConsts.primaryColor),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 30,
                              offset: Offset(0, 15),
                              spreadRadius: 0,
                              color: AppConsts.shadow.withValues(alpha: 0.3))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          spacing: 15,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor:
                                  AppConsts.primaryColor.withValues(alpha: .3),
                              child:
                                  SvgPicture.asset("assets/icons/dollor.svg"),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Share and Earn!",
                                  style: CustomTextStyle.h3,
                                ),
                                Text(
                                  "Invite friends, get 25% from their first purchase.",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  RowButton(
                      onPressedicon: () {},
                      onPressed: () {},
                      title: "Apply the discount")
                ],
              ),
            ],
          )),
    );
  }
}

class CuponDialog2 extends StatefulWidget {
  const CuponDialog2({super.key});

  @override
  State<CuponDialog2> createState() => _CuponDialog2State();
}

class _CuponDialog2State extends State<CuponDialog2> {
  void sowDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Color(0xffffffff),
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return CuponDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .66,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 10,
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 40,
                  backgroundColor:
                      AppConsts.primaryColor.withValues(alpha: 0.3),
                  child: SvgPicture.asset("assets/icons/dollor.svg", width: 30),
                ),
                Text(
                  "Earn 25% with Referrals!",
                  style: CustomTextStyle.h2,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Share your referral code. Your friend signs up and gets 25% off their first purchase. You earn 25% of their purchase amount!",
                  style: CustomTextStyle.h3,
                ),
                DottedBorder(
                  radius: Radius.circular(30),
                  color: AppConsts.shadow,
                  strokeCap: StrokeCap.round,
                  borderType: BorderType.RRect,
                  strokeWidth: 1,
                  dashPattern: [9, 3],
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * .8,
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppConsts.buttonDisabledColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ID233323",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.copy,
                          color: AppConsts.primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            RowButton(
                onPressedicon: () {
                  Navigator.pop(context);
                  sowDialog(context);
                },
                onPressed: () {
                  dialogshow(context);
                },
                title: "Share Code"),
          ],
        ),
      ),
    );
  }
}

void dialogshow(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        buttonPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        actions: [
          Container(
            height: 560,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppConsts.bgcolor),
                  child: Column(
                    spacing: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Logo.svg",
                        width: 40,
                      ),
                      Image.asset('assets/images/Asset .png'),
                      Text(
                        textAlign: TextAlign.center,
                        "Get on the road to success! 🚗",
                        style: CustomTextStyle.h2,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Your friend has shared the key to acing your driving theory test – enjoy a 20% discount!",
                        style: CustomTextStyle.h3,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 6,
                    children: [
                      Text(
                        "Use the code RJGJ1Q to register! Get a 20% discount on your driving theory test preparation.",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Download our app:\n🍏 App Store: [App Store Link]\n🤖 Google Play: [Google Play Link]",
                        style: TextStyle(fontSize: 12),
                      ), Text(
                        "-Ace your test with ease and savings!",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );
    },
  );
}
