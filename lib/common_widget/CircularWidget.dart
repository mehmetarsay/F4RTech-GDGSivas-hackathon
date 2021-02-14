import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:flutter/material.dart';
class CircularWidget extends StatelessWidget {
  final double height;
  final double width;
  final String photo;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.getHeightValue(context, height),
      width: Constants.getWidthValue(context, width,),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white
      ),
      child: Image.asset(
        photo==null ? 'assets/volunteer.png':photo,
        fit: BoxFit.fill,
      ),
    );

  }

  CircularWidget({this.height=100, this.width=100, this.photo});
}
