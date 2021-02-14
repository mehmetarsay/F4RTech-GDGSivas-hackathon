import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:flutter/material.dart';

class ProfilWidget extends StatelessWidget {
  String name;
  String email;
  String phone;
  UserType userType;
  List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.getHeightValue(context, 270),
      decoration: BoxDecoration(
        color: colors[0],
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [colors[0], Colors.white]),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            top: -Constants.getHeightValue(context, 20),
            child: Image.asset(
              'assets/hs1.png',
              width: Constants.getWidthValue(context, 400),
            ),
          ),
          Positioned(
            bottom: Constants.getHeightValue(context, 10),
            right: Constants.getWidthValue(context, 10),
            left: Constants.getWidthValue(context, 10),
            child: topInfo(context),
          ),
        ],
      ),
    );
  }

  Container topInfo(BuildContext context) {
    return Container(
      width: Constants.getWidth(context) * 0.80,
      height: Constants.getHeight(context) * 0.17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 7,
            offset: Offset(0.1, 0.1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: Constants.getHeight(context) * 0.01,
          ),
          userInfo('', name, 18.0, FontWeight.w800),
          Divider(
            height: 5,
            endIndent: 50,
            indent: 50,
            color: Colors.black,
          ),
          userInfo('E-posta: ', email, 12.0, FontWeight.w500),
          Divider(
            height: 5,
            endIndent: 50,
            indent: 50,
            color: Colors.black,
          ),
          userInfo('Telefon: ', '$phone', 12.0, FontWeight.w500),
        ],
      ),
    );
  }

  Text userInfo(String text, detail, size, weight) {
    return Text(
      '$text $detail',
      style: TextStyle(
          color: colors[0].withOpacity(1), fontSize: size, fontWeight: weight),
    );
  }

  ProfilWidget(
      {this.userType,
      this.name = 'name',
      this.email = 'email',
      this.phone = '0539391552'}) {
    if (userType == UserType.VOLUNTEER) {
      colors = ColorTable.greenT;
    } else {
      colors = ColorTable.blueT;
    }
  }
}
