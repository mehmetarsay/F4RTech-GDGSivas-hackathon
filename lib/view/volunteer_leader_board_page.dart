import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/TextWidget1.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/profil_widget.dart';
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
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget('EN GÖNÜLLÜLER'),
          Container(
            height: Constants.getHeightValue(context, 320),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                ],
              ),
            ),
          ),
        ],
      ),
      ],
    ),)
    ,
    );
  }

  LeaderFirsThree() {
    return Container(
      width: Constants.getWidth(context),
      height: Constants.getHeightValue(context, 270),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
        color: ColorTable.blue
      ),
      child: Stack(
        children: [
        Positioned(
            bottom: 20,
            right: 100,
            left: 100,
            child:CircularContainer(150, 150,'Lider 1','assets/crown1.png'),),
          Positioned(
            bottom: 20,
            left: 10,
            child:CircularContainer(100, 100,'Lider 2','assets/crown2.png'),),
          Positioned(
            bottom: 20,
            right: 10,
            child:CircularContainer(100, 100,'Lider 3','assets/crown3.png'),),
        ],
      ),
    );
  }
  CircularContainer(double w, double h,String text,String photo){
    return Column(
      children: [
        Container(
            child: Image.asset(
              photo,
            ),
        ),
        Container(
          height: Constants.getHeightValue(context, h),
          width: Constants.getWidthValue(context, w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white
          ),
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
  UserList(){
    return Container(
      height: Constants.getHeightValue(context, 74),
      width: Constants.getWidthValue(context, 327),
      color: ColorTable.green,
    );
  }
}
