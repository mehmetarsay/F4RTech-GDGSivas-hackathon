import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/SharerApprovedWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/TextWidget1.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/profil_widget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/progressbarWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/request_model.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SharerPage extends StatefulWidget {
  @override
  _SharerPageState createState() => _SharerPageState();
}

class _SharerPageState extends State<SharerPage> {
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
      height: Constants.getHeight(context),
      child: SafeArea(
        child: Column(
          children: [
            ProfilWidget(
              name: context.read<UserModel>().user.fullName,
              email: context.read<UserModel>().user.email,
              phone: context.read<UserModel>().user.phoneNumber,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget('SON İŞLEMLER'),
                Container(
                  height: Constants.getHeightValue(context, 310),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: context.watch<RequestModel>().requestList.length != 0 ?  Column(
                      children:
                      context.watch<RequestModel>().requestList.map((e) {
                        if(e.requested.uid == _userModel.user.uid){
                          return SharerApproved(
                            text1: e.requested.fullName,
                            text2: e.requesting.fullName,
                            voluntter: e.statusList.last.toString() ==
                                RequestStatus.WAITING.toString()
                                ? false
                                : true,
                          );
                        }else {
                          return SizedBox();
                        }
                      }).toList() ,
                    ) : ProgressBar(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    /*if (_userModel.state == ViewState.Idle) {
      if (_userModel.user != null) {
        return
      } else {
        return Container();
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
