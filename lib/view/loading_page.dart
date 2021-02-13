import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/SelectLocation.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/deneme_page.dart';
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
    final _userModel = Provider.of<UserModel>(context);
    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user == null) {
        return LandingPage();
      }
      else  {
        return Denemepage();
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
          ),
        ),
      );
    }
  }
}
