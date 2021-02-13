import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          LogInPage(true),
          Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              height: Constants.getHeight(context),
              width:Constants.getWidth(context) ,
              child: Stack(
                children: [
                  Positioned(
                    left: -Constants.getWidthValue(context, 17),
                    bottom: Constants.getHeightValue(context, 50),
                    child: Container(
                      child: Image.asset(
                        'assets/b2.png',
                        height: Constants.getHeight(context),
                        width: Constants.getWidth(context)/2,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: Constants.getHeightValue(context, 60),
                    child: Container(
                      child: Image.asset(
                        'assets/a1.png',
                        height: Constants.getHeight(context),
                        width: Constants.getWidth(context)/2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          LogInPage(false)
        ],
      ),
    );
  }

  Widget landingText(
      {@required String title,
        @required String content,
        @required Color backgroundColor,int scroolPage}) {
    return InkWell(
      onTap: (){
        _pageController.animateToPage(
          scroolPage,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeIn,
        );
      },
      child: Container(
          padding: EdgeInsets.all(Constants.getHeightValue(context, 20)),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: backgroundColor)),
                  IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 48,
                        color: backgroundColor,
                      ),
                      onPressed: null),
                ],
              ),
              SizedBox(height: 16),
              Text(
                content,
                style: TextStyle(fontSize: 24, color: Colors.white),
              )
            ],
          )),
    );
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => ClampingScrollPhysics();
}