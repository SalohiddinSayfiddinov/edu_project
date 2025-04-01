import 'package:edu_project/core/constants/app_consts.dart';
import 'package:edu_project/core/constants/text_style.dart';
import 'package:edu_project/presentation/auth/view/login_page.dart';
import 'package:flutter/material.dart';

import '../../widgets/row_button.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    Image.asset(
      "assets/images/onboarding1.png",
      width: 300,
      height: 500,
    ),
    Image.asset(
      "assets/images/onboarding2.png",
      width: 300,
      height: 500,
    ),
    Image.asset(
      "assets/images/onboarding3.png",
      width: 300,
      height: 500,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConsts.bgcolor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/fon.png"),
              ),
            ),
          ),
          PageView(
            controller: _pageViewController,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [_pages[_currentPageIndex]],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(0, -40), color: Colors.white, blurRadius: 30)
              ]),
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Seamless \nDonation Process",
                    style: CustomTextStyle.h1,
                  ),
                  Text(
                      textAlign: TextAlign.center,
                      "Streamlined donation process is essential for  Lumio. Users should be able to easily make a donation with just a few clicks"),
                  Spacer(),
                  RowButton(
                    onPressedicon: () {
                      if (_currentPageIndex > 0 && _currentPageIndex != 0) {
                        setState(() {
                          _currentPageIndex--;
                        });
                      }
                    },
                    onPressed: () {
                      if ( _currentPageIndex < 2) {
                        setState(() {
                          _currentPageIndex++;
                        });
                      } else if(_currentPageIndex==2)  {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ));
                      }
                    },
                    title: _currentPageIndex != 2
                        ? "Next"
                        : "Drive Forward to the Checkout!",
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: 20,
            child: SizedBox(
              width: 320,
              child: LinearProgressIndicator(
                minHeight: 4,
                borderRadius: BorderRadius.circular(10),
                valueColor: AlwaysStoppedAnimation(AppConsts.primaryColor),
                value: _currentPageIndex == 0
                    ? 0.33
                    : (_currentPageIndex == 1 ? 0.66 : 1.0),
                backgroundColor: AppConsts.bgcolor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
  