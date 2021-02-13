import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/AppBarWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/request_widget.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/map_view.dart';
import 'package:flutter/material.dart';
class VolunteerRequestPage extends StatefulWidget {
  @override
  _VolunteerRequestPageState createState() => _VolunteerRequestPageState();
}

class _VolunteerRequestPageState extends State<VolunteerRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            AppBarWidget('GÖNÜLLÜ', ColorTable.greenT[1],mapButton: true,mapOnButton: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MapView()));
            },),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  RequestWidget(volunteer: true,text: 'Hayırsever Adı',subText: ''
                      'Ürün Detayı Açıklaması',)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
