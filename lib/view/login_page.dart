import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/accept_button.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/my_text_field.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/signup_page.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  bool userType;
  @override
  _LogInPageState createState() => _LogInPageState();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LogInPage(this.userType);
}

class _LogInPageState extends State<LogInPage> {//false: gönüllü / true: hayırsever

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
                      MyTextField(label: 'Email', controller: widget.email,userType: widget.userType,),
                      MyTextField(label: 'Şifre', controller: widget.password,userType: widget.userType,),
                      Container(
                        width: Constants.getWidth(context),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Şifremi Unuttum?',
                          style: TextStyle(
                              color: widget.userType == false ?ColorTable.blueT[3]:ColorTable.greenT[3],
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      widget.userType ==false ? AcceptButton('Giriş Yap',ColorTable.blue):
                      AcceptButton('Giriş Yap',ColorTable.green),
                      //Hesabın mı yok? Kayıt ol
                      Container(
                        width: Constants.getWidth(context),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              'Hesabın mı yok?',
                              style: TextStyle(
                                  color: widget.userType == false ?ColorTable.blueT[3]:ColorTable.greenT[3],
                                  fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) => (SignUpPage(widget.userType))),
                                        (Route<dynamic> route) => true);
                              },
                              child: Text(
                                ' Kayıt Ol',
                                style: TextStyle(
                                    color: widget.userType == false ?ColorTable.blueT[0]:ColorTable.greenT[0],
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),

                      ),
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(
                            color: widget.userType == false ?ColorTable.blueT[3]:ColorTable.greenT[3],
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
