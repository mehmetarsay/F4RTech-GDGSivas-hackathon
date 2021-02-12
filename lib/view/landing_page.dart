import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/login_page.dart';
import 'package:flutter/material.dart';

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
            body: SafeArea(
              child: Container(
                height: Constants.getHeight(context),
                width:Constants.getWidth(context) ,
                child: Column(
                  children: [
                    landingText(
                        title: 'HAYIRSEVER',
                        content:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisis justo mollis, auctor consequat urna.',
                        backgroundColor: ColorTable.blue,
                    scroolPage: 2),
                    landingText(
                        title: 'GÖNÜLLÜ',
                        content:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisis justo mollis, auctor consequat urna.',
                        backgroundColor: ColorTable.green,scroolPage: 0)
                  ],
                ),
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
          padding: EdgeInsets.all(16),
          color: backgroundColor,
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
                          color: Colors.white)),
                  IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 48,
                        color: Colors.white,
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