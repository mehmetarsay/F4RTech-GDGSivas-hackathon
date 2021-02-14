import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/sharer_product_add_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/deneme_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/sharer_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/sharer_request_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/volunteer_leader_board_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/volunteer_profil_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/volunteer_request_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/colors.dart';

class HomeScreenPage extends StatefulWidget {
  UserType userType;
  List<Color> backColor;
  @override
  HomeScreen createState() => HomeScreen();

  HomeScreenPage(this.userType){
    if(userType == UserType.VOLUNTEER){
      backColor = ColorTable.greenT;
    }
    else{
      backColor = ColorTable.blueT;
    }
  }
}

class HomeScreen extends State<HomeScreenPage>
    with SingleTickerProviderStateMixin, ChangeNotifier {
  Widget _bodyPage = null;
  bool isCollapsed = true;
  double screenWidth, screenHeight;

  final Duration duration = const Duration(milliseconds: 400);

  set bodyPage(Widget value) {
    _bodyPage = value;
    notifyListeners();
  }

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
      backgroundColor: widget.backColor[5],
      body: new SafeArea(
        child: new Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                child: Image.asset(
                   'assets/back.png',
                ),
              ),
            ),
            customDrawer(context),
            screenBack(context),
            homeScreen(context,SharerPage()),
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
            child:UserTypeFunc() ,
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
          color: widget.backColor[1],
          borderRadius: isCollapsed
              ? BorderRadius.all(Radius.circular(0))
              : BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }

  Widget homeScreen(context,Widget page) {
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
              if(details.delta.dy>0){
                if (details.delta.dx < 3) {
                  this.closeDrawer();
                } else if (details.delta.dx > 3) {
                  this.openDrawer();
                }
              }

            },child: _bodyPage != null ? _bodyPage : widget.userType == UserType.VOLUNTEER ? VolunteerProfilPage():SharerPage(),
              //child: SharerPage(),
            ),
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
        child: Container(
          width: Constants.getWidthValue(context, 150),
          height: Constants.getHeightValue(context, 45),

          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: widget.backColor[1]),
            color: widget.backColor[5],
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: widget.backColor[0],
              fontSize: Constants.getHeightValue(context, 20),
            ),
          ),
        ),
      ),
    );
  }
  Widget UserTypeFunc(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        options(
            text: 'Profil',
            onTap: () {
              setState(() {
                closeDrawer();
                _bodyPage = widget.userType == UserType.VOLUNTEER ? VolunteerProfilPage():SharerPage();
              });

            }),
        options(
            text: widget.userType == UserType.VOLUNTEER ? 'Ürün Al':'Ürün Paylaş',
            onTap: (){
              setState(() {
                closeDrawer();
                _bodyPage = widget.userType == UserType.VOLUNTEER ? VolunteerRequestPage(): ProductAddPage();
              });

            }),
        if(widget.userType == UserType.VOLUNTEER)
          options(
              text: 'Liderlik',
              onTap: (){
                setState(() {
                  closeDrawer();
                  _bodyPage = VolunteerLeaderBoardPage();
                });
              }),
        if(widget.userType == UserType.SHARER)
          options(
            text: 'Gelen İstekler',
            onTap: (){
              setState(() {
                closeDrawer();
                _bodyPage = SharerRequestPage();
              });
            }),
        options(
            text: 'Çıkış Yap',
            onTap: () async {
              final _userModel = Provider.of<UserModel>(context, listen: false);
              await _userModel.signOut();
              //Navigator.pop(context);
            }),

      ],
    );
  }
}
