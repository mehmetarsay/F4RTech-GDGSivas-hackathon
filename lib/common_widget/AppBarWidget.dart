import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:flutter/material.dart';
class AppBarWidget extends StatelessWidget {
  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.getHeightValue(context, 60),
      width: Constants.getWidth(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.arrow_back,
              size: Constants.getHeightValue(context, 40),
              color: color,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  text,
                  style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBarWidget(this.text,this.color);
}
