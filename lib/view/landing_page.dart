import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {

    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: [
          LogInPage(UserType.VOLUNTEER),
          Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Container(
                height: Constants.getHeight(context),
                width:Constants.getWidth(context) ,
                child: Stack(
                  children: [
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
                    ),
                    Positioned(
                      left: -Constants.getWidthValue(context, 17),
                      bottom: Constants.getHeightValue(context, 53),
                      child: Container(
                        child: Image.asset(
                          'assets/b2.png',
                          height: Constants.getHeight(context),
                          width: Constants.getWidth(context)/2,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        landingText(
                            title: 'HAYIRSEVER',
                            backgroundColor: ColorTable.blue,
                        scroolPage: 2),
                        landingText(
                            title: 'GÖNÜLLÜ',
                            backgroundColor: ColorTable.green,scroolPage: 0)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          LogInPage(UserType.SHARER)
        ],
      ),
    );
  }

  Widget landingText(
      {@required String title,
        @required Color backgroundColor,int scroolPage}) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
            pageController.animateToPage(
              scroolPage,
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeIn,
            );
          },
          child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: scroolPage == 2 ?LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    backgroundColor,backgroundColor.withOpacity(0.1)
                  ]
                ):
                LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      backgroundColor,backgroundColor.withOpacity(0.1)
                    ]
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child:scroolPage == 2 ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Container(
                        width: Constants.getWidthValue(context, 250),
                        child: Text('Paylaştığın senindir, biriktirdiğin değil. Hemen Hayırsever ol.',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold
                        ),),
                      )
                    ],
                  ),

                  Icon(
                    Icons.arrow_forward,
                    size: 48,
                    color: backgroundColor,
                  ),
                ],
              ):
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 48,
                    color: backgroundColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Container(
                        alignment: Alignment.topRight,
                        width: Constants.getWidthValue(context, 275),
                        child: Text('Başkasına Yardımı Dokunan İnsan Kusursuz İnsandır.Şimdi Gönüllü ol.',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                        maxLines: 2,

                        ),
                      )

                    ],
                  ),
                ],
              )
          ),
        ),
        Positioned(
          bottom: 5,
          right: scroolPage == 2 ?10:Constants.getWidth(context)-40,
          child: Container(
            height: 30,
            width: 30,
            child: Icon(
              Icons.info,
              color: backgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => ClampingScrollPhysics();
}