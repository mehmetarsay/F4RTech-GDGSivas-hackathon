import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/progressbarWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/home_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/landing_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    if (context.watch<UserModel>().state == ViewState.Idle) {
      if (context.watch<UserModel>().user == null) {
        return LandingPage();
      } else {
        return HomePage(
            context.watch<UserModel>().user.userType == UserType.VOLUNTEER.toString()
                ? UserType.VOLUNTEER
                : UserType.SHARER);
      }
    } else {
      return Scaffold(
        body: ProgressBar(),
      );
    }
  }
}
