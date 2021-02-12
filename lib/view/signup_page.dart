import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/accept_button.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/my_text_field.dart';
import 'package:flutter/material.dart';
class SignUpPage extends StatefulWidget {
  bool userType=false;//false: gönüllü / true: hayırsever
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController institution = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                  height: Constants.getHeightValue(context, 400),
                  width: Constants.getWidthValue(context, 304),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyTextField(label: 'İsim-Soyisim', controller: fullname,userType: widget.userType,),
                      MyTextField(label: 'Email', controller: email,userType: widget.userType,),
                      MyTextField(label: 'Telefon Numarası', controller: phoneNumber,userType: widget.userType,textInputType: TextInputType.number,),
                      MyTextField(label: 'Bağlı Kurum*', controller: institution,userType: widget.userType,),
                      widget.userType ==false ? AcceptButton('Kayıt Ol',ColorTable.blue):
                      AcceptButton('Kayıt Ol',ColorTable.green),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
