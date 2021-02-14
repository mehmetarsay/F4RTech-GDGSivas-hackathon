import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
class RequestWidget extends StatelessWidget {
  bool volunteer;// true data is volunteer / false data is sharer
  String photo;
  double degree;
  String text;
  String subText;
  Function onTap;
  String rightIconText;
  IconData rightIcon;
  Color backcolor;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: Constants.getWidthValue(context, 20)),
      child: Container(
        height: Constants.getHeightValue(context, 74),
        width: Constants.getWidthValue(context, 330),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.bottomLeft,
                colors: [backcolor, backcolor.withOpacity(0.3)])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Constants.getWidthValue(context, 250),
              child: Padding(
                padding:  EdgeInsets.only(left:Constants.getWidthValue(context, 8)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: Constants.getHeightValue(context, 56),
                      width: Constants.getHeightValue(context, 56),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: Constants.getWidthValue(context, 8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if(volunteer==false)Row(
                            children: [
                              IconShadowWidget(
                                Icon(
                                  Icons.star,
                                  color: ColorTable.yellow,
                                  size: Constants.getHeightValue(context, 18),
                                ),
                                shadowColor: Colors.black.withOpacity(0.5),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: Text(
                                  "4.7",
                                  style: TextStyle(
                                      color: ColorTable.yellow,
                                      fontWeight: FontWeight.w900,
                                      shadows: [
                                        BoxShadow(
                                            color: Colors.black, blurRadius: 1)
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            text,
                            style: TextStyle(
                                color: textColor,
                                fontSize: Constants.getHeightValue(context, 18),
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            width: Constants.getWidthValue(context, 160),
                            child: Text(
                              subText,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Constants.getHeightValue(context, 9),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right:Constants.getWidthValue(context, 15)),
              child: Material(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                child: Ink(
                  height: Constants.getHeightValue(context, 56),
                  width: Constants.getWidthValue(context, 64),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [backcolor.withOpacity(0.9),backcolor.withOpacity(0.01)]
                      )
                  ),
                    child: InkWell(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)) ,
                    splashColor: backcolor,
                    onTap: (){
                      onTap();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconShadowWidget(
                            Icon(
                              rightIcon,
                              color: Colors.white,
                              size: Constants.getHeightValue(context, 30),
                            ),
                            shadowColor: Colors.black.withOpacity(0.5),
                          ),
                          Expanded(
                            child: Text(
                              rightIconText,style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: Constants.getHeightValue(context, 10),
                                shadows: [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2)
                                ]),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  RequestWidget({this.volunteer=false, this.photo, this.degree, this.text,
      this.subText, this.onTap}){
    if(volunteer==false){
      rightIcon = Icons.check;
      backcolor = ColorTable.green;
      rightIconText = 'Onayla';
      textColor = ColorTable.greenT[0];
    }
    else {
      rightIcon = Icons.add;
      backcolor = ColorTable.blue;
      rightIconText = 'Talep\nEt';
      textColor = ColorTable.blueT[0];
    }
  }
}
