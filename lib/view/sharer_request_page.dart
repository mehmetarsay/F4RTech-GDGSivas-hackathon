import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/AppBarWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/progressbarWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/request_widget.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/request_model.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SharerRequestPage extends StatefulWidget {
  @override
  _SharerRequestPageState createState() => _SharerRequestPageState();
}

class _SharerRequestPageState extends State<SharerRequestPage> {
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
            AppBarWidget('HAYIRSEVER', ColorTable.blueT[1]),
            Expanded(
              child: context.watch<RequestModel>().requestList.isNotEmpty ? Column(
                children: context.watch<RequestModel>().requestList.map((e) {
                  if (e.requested.uid == _userModel.user.uid) {
                    return RequestWidget(
                      volunteer: false,
                      photo: e.requestedProduct.imageUrl,
                      degree: e.requesting.degree,
                      text: e.requesting.fullName,
                      subText: e.requestedProduct.name,
                      onTap: () async{
                        e.statusList.add(RequestStatus.COMPLETED.toString());
                        await e.reference.update({'statusList' : e.statusList});
                        print('İstek atıldı');
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                }).toList(),
              ) : ProgressBar(),
            )
          ],
        ),
      ),
    );

  }
}
