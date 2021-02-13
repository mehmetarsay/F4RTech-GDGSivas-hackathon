import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/accept_button.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/my_text_field.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/user.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/signup_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


class LogInPage extends StatefulWidget {
  UserType userType;

  @override
  _LogInPageState createState() => _LogInPageState();
  LogInPage(this.userType);
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  //false: gönüllü / true: hayırsever

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: Constants.getHeight(context),
          width: Constants.getWidth(context),

          child: Stack(
            children: [
              widget.userType == UserType.VOLUNTEER ?Positioned(
                right: 0,
                bottom: Constants.getHeightValue(context, 47),
                child: Container(
                  child: Image.asset(
                    'assets/b1.png',
                    height: Constants.getHeight(context),
                    width: Constants.getWidth(context)/2,
                  ),
                ),
              ):
              Positioned(
                left: 0,
                bottom: Constants.getHeightValue(context, 60),
                child: Container(
                  child: Image.asset(
                    'assets/a2.png',
                    height: Constants.getHeight(context),
                    width: Constants.getWidth(context)/2,
                  ),
                ),
              ),
              Positioned(
                bottom: Constants.getHeightValue(context, 20),
                left: Constants.getWidthValue(context, 35),
                right: Constants.getWidthValue(context, 35),
                child: Container(
                  width: Constants.getWidthValue(context, 304),
                  height: Constants.getHeightValue(context, 343),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyTextField(
                        label: 'Email',
                        controller: email,
                        userType: widget.userType,
                      ),
                      MyTextField(
                        label: 'Şifre',
                        controller: password,
                        userType: widget.userType,
                      ),
                      Container(
                        width: Constants.getWidth(context),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Şifremi Unuttum?',
                          style: TextStyle(
                              color: widget.userType == UserType.VOLUNTEER
                                  ? ColorTable.greenT[3]
                                  : ColorTable.blueT[3],
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      widget.userType == UserType.VOLUNTEER
                          ? AcceptButton(
                        'Giriş Yap',
                        ColorTable.green,
                        onTap: () async {
                          final _userModel =
                          Provider.of<UserModel>(context, listen: false);
                          try {
                            await _userModel.signInWithEmailAndPassword(
                                email: email.text,
                                password: password.text);
                          } catch (e) {
                            print(e);
                          }
                        },
                      ):AcceptButton('Giriş Yap', ColorTable.blue, onTap: () async {
                        final _userModel =
                        Provider.of<UserModel>(context, listen: false);
                        try {
                          await _userModel.signInWithEmailAndPassword(
                              email: email.text,
                              password: password.text);
                        } catch (e) {
                          print(e);
                        }
                      },
                      )
                      ,
                      //Hesabın mı yok? Kayıt ol
                      Container(
                        width: Constants.getWidth(context),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              'Hesabın mı yok?',
                              style: TextStyle(
                                  color: widget.userType == UserType.VOLUNTEER ?ColorTable.greenT[2] : ColorTable.blueT[2],
                                  fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            (SignUpPage(widget.userType))),
                                    (Route<dynamic> route) => true);
                              },
                              child: Text(
                                ' Kayıt Ol',
                                style: TextStyle(
                                    color: widget.userType == UserType.VOLUNTEER ?ColorTable.greenT[2] : ColorTable.blueT[2],
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(
                            color: widget.userType == UserType.VOLUNTEER ?ColorTable.greenT[2] : ColorTable.blueT[2],
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
