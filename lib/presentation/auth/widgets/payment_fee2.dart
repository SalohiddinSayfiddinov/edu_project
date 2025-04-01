import 'package:edu_project/core/constants/app_consts.dart';
import 'package:edu_project/core/constants/text_style.dart';
import 'package:edu_project/presentation/widgets/row_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentFee2 extends StatelessWidget {
  const PaymentFee2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.red.withValues(alpha: .3),
          child: SvgPicture.asset("assets/icons/Card.svg"),
        ),
        Text(
          "Payment Failed",
          style: CustomTextStyle.h2,
        ),
        Text(
          textAlign: TextAlign.center,
          "The card you entered appears to be invalid. Please check your card details and try again, or use a different payment card.",
          style: CustomTextStyle.h3,
        ),
        SizedBox(height: 140),
        RowButton(
            onPressedicon: () {},
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return DetaileCheck();
                },
              ));
            },
            title: "Try Again")
      ],
    );
  }
}

class DetaileCheck extends StatelessWidget {
  const DetaileCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConsts.bgcolor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 10,
              children: [
                SvgPicture.asset("assets/icons/Group 18.svg", width: 80),
                Text(
                  textAlign: TextAlign.center,
                  "Thank you for your \npurchase.",
                  style: CustomTextStyle.h2,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    spacing: 60,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transaction ID",
                            style: TextStyle(color: AppConsts.shadow),
                          ),
                          Text(
                            "#232213",
                            style: CustomTextStyle.h3,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(color: AppConsts.shadow),
                          ),
                          Text(
                            "30/10/2023",
                            style: CustomTextStyle.h3,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Customer Information",
                        style: TextStyle(color: AppConsts.shadow),
                      ),
                      Text(
                        "Ahmad Holmatov",
                        style: CustomTextStyle.h3,
                      ),
                      Text(
                        "finance@banana.com",
                        style: CustomTextStyle.h3,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "DESCRIPTION",
                            style: TextStyle(color: AppConsts.shadow),
                          ),
                          Text(
                            "RATE",
                            style: TextStyle(color: AppConsts.shadow),
                          ),
                          Text(
                            "QTY",
                            style: TextStyle(color: AppConsts.shadow),
                          ),
                          Text(
                            "SUBTOTAL",
                            style: TextStyle(color: AppConsts.shadow),
                          )
                        ],
                      ),
                      Divider(
                        color: AppConsts.shadow,
                        thickness: .4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("RPA Services 1x3\n months",
                              style: CustomTextStyle.h3),
                          Text("299 Sek", style: CustomTextStyle.h3),
                          Text("1", style: CustomTextStyle.h3),
                          Text("239 Sek", style: CustomTextStyle.h3)
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(color: AppConsts.shadow),
                          ),
                          Text(
                            "239 Sek",
                            style: CustomTextStyle.h3,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Text(
                                "Moms",
                                style: TextStyle(color: AppConsts.shadow),
                              ),
                              Container(
                                padding: EdgeInsets.all(1),
                                color: AppConsts.primaryColor,
                                child: Text(
                                  "12%",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          Text(
                            "39 Sek",
                            style: CustomTextStyle.h3,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Moms",
                            style: TextStyle(color: AppConsts.shadow),
                          ),
                          Text(
                            "239 Sek",
                            style: CustomTextStyle.h3,
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "GRAND TOTAL",
                            style: TextStyle(color: Colors.red),
                          ),
                          Text(
                            "239 Sek",
                            style: CustomTextStyle.h3,
                          )
                        ],
                      )
                    ],
                  ),
                ),SizedBox(height: 15),
                RowButton(
                    onPressedicon: () {}, onPressed: () {}, title: "Download"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
