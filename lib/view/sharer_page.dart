import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/SharerApprovedWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/TextWidget1.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/profil_widget.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SharerPage extends StatefulWidget {
  @override
  _SharerPageState createState() => _SharerPageState();
}

class _SharerPageState extends State<SharerPage> {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user != null) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              children: [
                ProfilWidget(
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
                          children: [
                            SharerApproved(
                              text1: 'mehmet',
                              text2: 'bilal',
                            ),
                            SharerApproved(
                              text1: 'mehmet',
                              text2: 'bilal',
                            ),
                            SharerApproved(
                              text1: 'mehmet',
                              text2: 'bilal',
                            ),
                            SharerApproved(
                              text1: 'mehmet',
                              text2: 'bilal',
                            ),
                            SharerApproved(),
                            SharerApproved(),
                            SharerApproved(),
                            SharerApproved(),
                          ],
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
        return Container();
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
