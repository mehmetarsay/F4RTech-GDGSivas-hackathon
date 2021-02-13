import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
  final String label;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function onSubmit;
  TextInputType textInputType;
  final bool userType;//false: gönüllü / true: hayırsever
  bool boxShadow;

   MyTextField({this.label, this.focusNode, this.controller, this.onSubmit,this.userType=false,this.textInputType=TextInputType.text,this.boxShadow =true});
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
          color: userType == false ?ColorTable.blueT[2]:ColorTable.greenT[2],
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
              color: userType == false ?ColorTable.blueT[5]:ColorTable.greenT[4]
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: userType == false ?ColorTable.blueT[5]:ColorTable.greenT[5]),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: userType == false ?ColorTable.blueT[3]:ColorTable.greenT[1]),
          ),
        ),
      ),
    );
  }
}
