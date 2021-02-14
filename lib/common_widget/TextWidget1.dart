import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:flutter/material.dart';
class TextWidget extends StatelessWidget {
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        height: Constants.getHeightValue(context, 34),
        width: Constants.getWidthValue(context, 327),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: Constants.getHeightValue(context, 15),
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: ColorTable.blue,
              height: 1,
              thickness: 3,
              indent: 1,
              endIndent: Constants.getWidthValue(context, 300),
            )
          ],
        ),
      ),
    );
  }

  TextWidget(this.text);
}
