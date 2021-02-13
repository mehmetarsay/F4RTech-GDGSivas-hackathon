import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:flutter/material.dart';
class AcceptButton extends StatelessWidget {
  String text;
  Color color;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Constants.getWidthValue(context, 304),
        height: Constants.getHeightValue(context, 41),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: Constants.getHeightValue(context, 16)
            ),
          ),
        ),
      ),
    );
  }

  AcceptButton(this.text, this.color,{this.onTap});
}
