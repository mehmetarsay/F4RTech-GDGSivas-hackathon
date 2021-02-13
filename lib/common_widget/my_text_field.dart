import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
  final String label;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function onSubmit;
  TextInputType textInputType;
  final UserType userType;//false: gönüllü / true: hayırsever
  bool boxShadow;

   MyTextField({this.label, this.focusNode, this.controller, this.onSubmit,this.userType,this.textInputType=TextInputType.text,this.boxShadow =true});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: boxShadow == true ?Colors.black.withOpacity(0.3):Colors.white,
            blurRadius: 8,
            offset: Offset(8,10),
          )
        ]
      ),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        onSubmitted: this.onSubmit,
        focusNode: focusNode,
        style: TextStyle(
          color: userType == UserType.VOLUNTEER ?ColorTable.greenT[2] : ColorTable.blueT[2],
          fontWeight: FontWeight.w400
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 0.0,
          ),
          filled: true,
          fillColor: Colors.white,
          labelText: this.label,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: userType == UserType.VOLUNTEER ?ColorTable.greenT[2] : ColorTable.blueT[2],
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: userType == UserType.VOLUNTEER ?ColorTable.greenT[2] : ColorTable.blueT[2],),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: userType == UserType.VOLUNTEER ?ColorTable.greenT[2] : ColorTable.blueT[2],),
          ),
        ),
      ),
    );
  }
}
