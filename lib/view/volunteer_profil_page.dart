import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/SharerApprovedWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/TextWidget1.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/profil_widget.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/request.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/sharer_user.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/product_model.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/request_model.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VolunteerProfilPage extends StatefulWidget {
  @override
  _VolunteerProfilPageState createState() => _VolunteerProfilPageState();
}

class _VolunteerProfilPageState extends State<VolunteerProfilPage> {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    final _requestModel = Provider.of<RequestModel>(context, listen: false);
    final _productModel = Provider.of<ProductModel>(context, listen: false);
    //_requestModel.readFilteredRequest('G3aXQ5XzUGgzuhH4LSjcpH0wyUZ2');
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            /*RaisedButton(onPressed: () async{
              Product pro = await _productModel.readProduct('1613263605679385');
              SharerUser sharerUser = await _userModel.differentUserFunc(pro.publisher);
              await _requestModel.saveRequest(requestedProduct: pro, requested: sharerUser, requesting: _userModel.user);
            }, child: Text('New Request'),),*/
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
                        if(e.requesting.uid == _userModel.user.uid)
                          print(e.statusList.last.toString());
                          print(RequestStatus.COMPLETED.toString());
                          return SharerApproved(
                            text1: e.requested.fullName,
                            text2: e.requesting.fullName,
                            voluntter: e.statusList.last.toString() ==
                                RequestStatus.WAITING.toString()
                                ? false
                                : true,
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
