import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/SharerApprovedWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/TextWidget1.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/profil_widget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/progressbarWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/showBottomWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/request_model.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VolunteerProfilPage extends StatefulWidget {
  @override
  _VolunteerProfilPageState createState() => _VolunteerProfilPageState();
}

class _VolunteerProfilPageState extends State<VolunteerProfilPage> {
  UserModel _userModel;
  @override
  void initState() {
    super.initState();
    _userModel = context.read<UserModel>();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            ProfilWidget(
              userType: UserType.VOLUNTEER,
              name: _userModel.user.fullName,
              email: _userModel.user.email,
              phone: _userModel.user.phoneNumber,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Constants.getWidthValue(context, 327),
                  child: Stack(
                    children: [
                      TextWidget('SON İŞLEMLER'),
                      Positioned(
                        right: 0,
                        bottom: 10,
                        top: 10,
                        child: Container(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Bekliyor ',style: TextStyle(
                                color: ColorTable.yellow,
                                  fontWeight: FontWeight.w900,
                                fontSize: Constants.getHeightValue(context, 9)
                              ),),
                              Text('Onaylandı ',style: TextStyle(
                                  color: ColorTable.green,
                                  fontWeight: FontWeight.w900,
                                  fontSize: Constants.getHeightValue(context, 9)
                              ),),
                              Text('Onaylanmadı ',style: TextStyle(
                                  color: Colors.red,
                                fontWeight: FontWeight.w900,
                                  fontSize: Constants.getHeightValue(context, 9)
                              ),)
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: Constants.getHeightValue(context, 315),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: context.watch<RequestModel>().requestList.isNotEmpty ? Column(
                      children:  context.watch<RequestModel>().requestList.map((e) {
                        if(e.requesting.uid == _userModel.user.uid){
                          return InkWell(
                            child: SharerApproved(
                              text1: e.requested.fullName,
                              text2: e.requesting.fullName,
                              requestStatus:e.statusList.last.toString(),
                              voluntter: e.statusList.last.toString() ==
                                  RequestStatus.WAITING.toString()
                                  ? false
                                  : true,
                            ),
                            onTap: (){
                              productInfo(e.requestedProduct.imageUrl,
                                  e.requested.fullName,
                                  e.requesting.fullName,
                                  e.requestedProduct.explanation,
                                  e.statusList.last.toString(),
                                  context,
                                ColorTable.greenT[4]
                              );
                            },
                          );
                        }else {
                          return SizedBox();
                        }
                      }).toList(),
                    ) : ProgressBar(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    /*return FutureBuilder(
        future: getData(_userModel.user.uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: Colors.white,
              child: SafeArea(
                child: Column(
                  children: [
                    //RaisedButton(onPressed: (){}, child: Text('New Request'),),
                    ProfilWidget(
                      userType: UserType.VOLUNTEER,
                      name: _userModel.user.fullName,
                      email: _userModel.user.email,
                      phone: _userModel.user.phoneNumber,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget('SON İŞLEMLER'),
                        Container(
                          height: Constants.getHeightValue(context, 320),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: _requestModel.requestList.map((e) {
                                return SharerApproved(
                                  text1: e.requested.fullName,
                                  text2: e.requesting.fullName,
                                  voluntter: e.statusList.last.toString() ==
                                      RequestStatus.COMPLETED.toString()
                                      ? true
                                      : false,
                                );

                                /*FutureBuilder(
                                    future: getDifUser(e.requested), builder: (context, sp) {
                                  if (sp.hasData) {
                                    return SharerApproved(
                                      text1: _userModel.user.fullName,
                                      text2: sp.data.fullName,
                                      voluntter: e.statusList.last.toString() ==
                                          RequestStatus.COMPLETED.toString()
                                          ? true
                                          : false,
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),);
                                  }
                                });*/
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });*/
    /*if (_requestModel.state == RequestViewState.Idle) {
      if (_requestModel.requestList.isNotEmpty) {
        print('Current User Id: ${_userModel.user.uid}');

      } else {
        return Center(
          child: Text('BOS'),
        );
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }*/
  }
}
