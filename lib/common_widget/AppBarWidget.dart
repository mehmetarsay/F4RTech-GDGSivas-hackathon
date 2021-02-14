import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:flutter/material.dart';
class AppBarWidget extends StatelessWidget {
  final String text;
  final Color color;
  final bool mapButton;
  final Function mapOnButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.getHeightValue(context, 60),
      width: Constants.getWidth(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                text,
                style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            if(mapButton)Padding(
              padding: const EdgeInsets.only(right:18.0,bottom: 20),
              child: Container(
                height: Constants.getHeightValue(context, 35),
                width: Constants.getHeightValue(context, 35),
                child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                    color:ColorTable.blueT[1].withOpacity(0.1),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    splashColor: ColorTable.blue,
                    onTap: (){
                      mapOnButton();
                    },
                    child: Container(
                      child: Icon(
                        Icons.edit_location,
                        size: Constants.getHeightValue(context, 30),
                        color: ColorTable.green,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBarWidget(this.text,this.color,{this.mapButton=false,this.mapOnButton});
}
