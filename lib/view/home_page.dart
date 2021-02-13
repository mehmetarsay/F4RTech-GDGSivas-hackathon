import 'package:flutter/material.dart';

import '../app/colors.dart';

class HomeScreenPage extends StatefulWidget {
  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<HomeScreenPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;

  final Duration duration = const Duration(milliseconds: 300);

  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _scaleBackAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _scaleBackAnimation =
        Tween<double>(begin: 1, end: 0.75).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return new Scaffold(
      backgroundColor: ColorTable.blue,
      body: new SafeArea(
        child: new Stack(
          children: <Widget>[
            customDrawer(context),
            screenBack(context),
            homeScreen(context),
          ],
        ),
      ),
    );
  }

  Widget customDrawer(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Kullanıcı Tipi',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    )),
                new Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          child: Center(
                        child: Text('İsim Soy İsim',
                            style: TextStyle(
                              color: ColorTable.greenT[2],
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                      Center(
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text('Resim')))
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[],
                ),
                options(
                    text: 'Profile',
                    onTap: () {
                      closeDrawer();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget screenBack(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: 0.40 * screenWidth,
      right: isCollapsed ? 0 : -0.8 * screenWidth,
      child: new ScaleTransition(
        scale: _scaleBackAnimation,
        child: Material(
          elevation: 8,
          color: ColorTable.greenT[2],
          borderRadius: isCollapsed
              ? BorderRadius.all(Radius.circular(0))
              : BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }

  Widget homeScreen(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.5 * screenWidth,
      right: isCollapsed ? 0 : -0.5 * screenWidth,
      child: new ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dx < 0) {
                this.closeDrawer();
              } else if (details.delta.dx > 0) {
                this.openDrawer();
              }
            },
            child: Container(
              color: ColorTable.greenT[1],
              child: Text('Deneme'),
            )),
      ),
    );
  }

  void closeDrawer() {
    setState(() {
      _controller.reverse();

      isCollapsed = true;
    });
  }

  void openDrawer() {
    setState(() {
      _controller.forward();

      isCollapsed = false;
    });
  }

  Widget options({@required String text, @required Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 7.5),
        child: Text(
          text,
          style: TextStyle(
            color: ColorTable.greenT[2],
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
