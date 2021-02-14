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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      child: context.watch<RequestModel>().requestList.length !=
                              0
                          ? Column(
                              children: context
                                  .watch<RequestModel>()
                                  .requestList
                                  .map((e) {
                                if (e.requested.uid == _userModel.user.uid) {
                                  return InkWell(
                                    child: SharerApproved(
                                      text1: e.requested.fullName,
                                      text2: e.requesting.fullName,
                                      requestStatus:
                                          e.statusList.last.toString(),
                                      voluntter: e.statusList.last.toString() ==
                                              RequestStatus.WAITING.toString()
                                          ? false
                                          : true,
                                    ),
                                    onTap: () {
                                      productInfo(e.requestedProduct.imageUrl,
                                      e.requested.fullName,
                                        e.requesting.fullName,
                                        e.requestedProduct.explanation,
                                          e.statusList.last.toString(),
                                        context,
                                        ColorTable.blueT[4]
                                      );
                                    },
                                  );
                                } else {
                                  return SizedBox();
                                }
                              }).toList(),
                            )
                          : ProgressBar(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
