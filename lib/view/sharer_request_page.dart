import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/AppBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';

class SharerRequestPage extends StatefulWidget {
  @override
  _SharerRequestPageState createState() => _SharerRequestPageState();
}

class _SharerRequestPageState extends State<SharerRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            AppBarWidget('HAYIRSEVER', ColorTable.blueT[1]),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  PageWidget(),
                  PageWidget(),
                  PageWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  PageWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Container(
        height: Constants.getHeightValue(context, 74),
        width: Constants.getWidthValue(context, 328),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.bottomLeft,
                colors: [ColorTable.green, ColorTable.green.withOpacity(0.3)])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Constants.getWidthValue(context, 250),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
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
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
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
                            "Gönüllü Adı",
                            style: TextStyle(
                                color: ColorTable.greenT[0],
                                fontSize: Constants.getHeightValue(context, 18),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "76 Kez Gönüllü oldu",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Constants.getHeightValue(context, 12),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:15.0),
              child: Material(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                child: Ink(
                  height: Constants.getHeightValue(context, 56),
                  width: Constants.getWidthValue(context, 64),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [Colors.white.withOpacity(0.8),ColorTable.green]
                      )
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)) ,
                    splashColor: ColorTable.blue,

                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconShadowWidget(
                            Icon(
                              Icons.check,
                              color: Colors.white,
                              size: Constants.getHeightValue(context, 30),
                            ),
                            shadowColor: Colors.black.withOpacity(0.5),
                          ),
                          Text(
                            'Onayla',style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              shadows: [
                                BoxShadow(
                                    color: Colors.black, blurRadius: 2)
                              ]),
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
}
