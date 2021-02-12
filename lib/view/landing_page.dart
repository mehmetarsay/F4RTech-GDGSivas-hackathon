import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:flutter/material.dart';
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'fmdogancan95@gmail.com',style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            color: ColorTable.blueT[1]
          ),
          ),
        ),
      ),
    );
  }
}
