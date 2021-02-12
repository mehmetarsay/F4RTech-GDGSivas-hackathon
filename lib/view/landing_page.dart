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
      body: SafeArea(
        child: Column(
          children: [
            landingText(
                title: 'HAYIRSEVER',
                content:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisis justo mollis, auctor consequat urna.',
                backgroundColor: ColorTable.blue),
            landingText(
                title: 'GÖNÜLLÜ',
                content:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisis justo mollis, auctor consequat urna.',
                backgroundColor: ColorTable.green)
          ],
        ),
      ),
    );
  }

  Widget landingText(
      {@required String title,
      @required String content,
      @required Color backgroundColor}) {
    return Container(
        padding: EdgeInsets.all(16),
        color: backgroundColor,
        height: MediaQuery.of(context).size.height / 2.1,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 48,
                      color: Colors.white,
                    ),
                    onPressed: null),
              ],
            ),
            SizedBox(height: 16),
            Text(
              content,
              style: TextStyle(fontSize: 24, color: Colors.white),
            )
          ],
        ));
  }
}
