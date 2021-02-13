import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/SharerApprovedWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/TextWidget1.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/profil_widget.dart';
import 'package:flutter/material.dart';
class VolunteerProfilPage extends StatefulWidget {
  @override
  _VolunteerProfilPageState createState() => _VolunteerProfilPageState();
}

class _VolunteerProfilPageState extends State<VolunteerProfilPage> {
  @override
  Widget build(BuildContext context) {
    print('AAAAAAAAAAAAAAA');
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            ProfilWidget(userType: UserType.VOLUNTEER,),
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
                          voluntter: true,
                        ),
                        SharerApproved(
                          text1: 'mehmet',
                          text2: 'bilal',
                          voluntter: true,
                        ),
                        SharerApproved(
                          text1: 'mehmet',
                          text2: 'bilal',
                          voluntter: true,
                        ),
                        SharerApproved(
                          text1: 'mehmet',
                          text2: 'bilal',
                          voluntter: true,
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
  }
}
