import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/CircularWidget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

productInfo(
    String photo,
    String publisherName,
    String volunterName,
    String explanation,
    String productName,
    String location,
    String status,
    BuildContext context,
    Color backColor) {
  Color Statuscolor;
  String StatusString;
  if (status == RequestStatus.COMPLETED.toString()) {
    Statuscolor = Colors.green;
    StatusString = 'TAMAMLANDI';
  } else if (status == RequestStatus.WAITING.toString()) {
    Statuscolor = Colors.yellow;
    StatusString = 'BEKLİYOR';
  } else if (status == RequestStatus.DENIED.toString()) {
    Statuscolor = Colors.red;
    StatusString = 'REDDEDİLDİ';
  }
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.green.withOpacity(0),
      builder: (context) {
        return Container(
          height: Constants.getHeight(context) / 2.2,
          decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white),
                ),
              ),
              Container(
                height: Constants.getHeight(context) / 2.5 - 30,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            //height: Constants.getHeightValue(context, 75),
                            width: Constants.getHeightValue(context, 75),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white),
                            child: CircleAvatar(
                                backgroundImage: photo != null
                                    ? NetworkImage(
                                        photo,
                                      )
                                    : AssetImage('assets/volunteer.png')),
                          ),
                        ),
                        Container(
                          width: Constants.getWidthValue(context, 200),
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircularWidget(
                                    width: 25,
                                    height: 25,
                                    photo: 'assets/sprofile.png',
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      publisherName,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          shadows: [
                                            BoxShadow(
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                                blurRadius: 8)
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  children: [
                                    CircularWidget(
                                      width: 25,
                                      height: 25,
                                      photo: 'assets/vprofile.png',
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        volunterName,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            shadows: [
                                              BoxShadow(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  blurRadius: 8)
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: Constants.getWidth(context),
                      child: Row(
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20),
                          ),
                          SizedBox(width: 20,),
                          Container(width: Constants.getWidth(context) / 1.5, child: Text(location, style: TextStyle(color: Colors.white),),)
                        ],
                      ),
                    ),

                    Container(
                      width: Constants.getWidthValue(context, 327),
                      height: Constants.getHeightValue(context, 55),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Açıklama\n$explanation',
                          style: TextStyle(
                              fontSize: Constants.getHeightValue(context, 12),
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Shimmer.fromColors(
                          baseColor: Statuscolor,
                          highlightColor: Colors.white,
                          direction: ShimmerDirection.ltr,
                          child: Text(
                            StatusString,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: Constants.getHeightValue(context, 50),
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        );
      });
}
