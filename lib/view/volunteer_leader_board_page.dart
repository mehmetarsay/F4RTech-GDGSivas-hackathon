import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/CircularWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/TextWidget1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VolunteerLeaderBoardPage extends StatefulWidget {
  @override
  _VolunteerLeaderBoardPageState createState() =>
      _VolunteerLeaderBoardPageState();
}

class _VolunteerLeaderBoardPageState extends State<VolunteerLeaderBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            LeaderFirsThree(),
            Container(
              width: Constants.getWidthValue(context, 327),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget('EN GÖNÜLLÜLER'),
                  Container(
                    height: Constants.getHeightValue(context, 320),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return UserList('bilal',index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  LeaderFirsThree() {
    return Container(
      width: Constants.getWidth(context),
      height: Constants.getHeightValue(context, 270),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
          color: ColorTable.green),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 100,
            left: 100,
            child: CircularContainer(150, 150, 'Lider 1', 'assets/crown1.png'),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: CircularContainer(100, 100, 'Lider 2', 'assets/crown2.png'),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: CircularContainer(100, 100, 'Lider 3', 'assets/crown3.png'),
          ),
        ],
      ),
    );
  }

  CircularContainer(double w, double h, String text, String photo) {
    return Column(
      children: [
        Container(
          child: Image.asset(
            photo,
          ),
        ),
        CircularWidget(
          width: w,
          height: h,
        ),
        Container(
          width: Constants.getWidthValue(context, w),
          height: Constants.getHeightValue(context, 36),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  UserList(String name,int index) {
    return Padding(
      padding: const EdgeInsets.only(top:12.0),
      child: Container(
        height: Constants.getHeightValue(context, 74),
        width: Constants.getWidthValue(context, 327),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: ColorTable.greenT[5],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Row(
                children: [
                  Text('${index+1}',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: Constants.getHeightValue(context, 35)
                    ),),
                  Padding(
                    padding: const EdgeInsets.only(left:18.0),
                    child: CircularWidget(
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:4.0),
                    child: Text(
                      name,
                      style: TextStyle(
                          color: ColorTable.greenT[1],
                          fontSize: Constants.getHeightValue(context, 20),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right:18.0),
              child: Container(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/heart-solid.png',
                      fit: BoxFit.fill,
                      height: Constants.getHeightValue(context, 40),
                      width: Constants.getWidthValue(context, 50),
                    ),
                    Positioned(
                      left: 10,
                      right: 10,
                      bottom: 10,
                      top: 10,
                      child: Text(
                        '555',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
