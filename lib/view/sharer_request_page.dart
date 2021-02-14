import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/AppBarWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/request_widget.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/request_model.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:provider/provider.dart';

class SharerRequestPage extends StatefulWidget {
  @override
  _SharerRequestPageState createState() => _SharerRequestPageState();
}

class _SharerRequestPageState extends State<SharerRequestPage> {
  RequestModel _requestModel;
  UserModel _userModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userModel = context.read<UserModel>();
    _requestModel = context.read<RequestModel>();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            AppBarWidget('HAYIRSEVER', ColorTable.blueT[1]),
            Expanded(
              child: context.watch<RequestModel>().requestList.isNotEmpty ? Column(
                children: context.watch<RequestModel>().requestList.map((e) {
                  if (e.requested.uid == _userModel.user.uid) {
                    return RequestWidget(
                      volunteer: false,
                      photo: e.requestedProduct.imageUrl,
                      degree: e.requesting.degree.toDouble(),
                      text: e.requesting.fullName,
                      subText: e.requesting.completedProductList.length
                          .toString(),
                      onTap: () {},
                    );
                  } else {
                    return SizedBox();
                  }
                }).toList(),
              ) : Center(child: CircularProgressIndicator(),), /*ListView(
                physics: BouncingScrollPhysics(),
                children:
                /*[
                  RequestWidget(volunteer: false,degree: 4.7,text: 'Gönüllü Adı',subText: ''
                      '76 kezz Gönüllülük yaptı',onTap: (){
                  },)

                ],*/
              ),*/
            )
          ],
        ),
      ),
    );
    /*if (_requestModel.state == RequestViewState.Idle) {
      if (_requestModel.requestList.length != null) {
        return
      } else {
        return Center(
          child: Text('İstek Yok'),
        );
      }
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }*/
  }
}
