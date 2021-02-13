import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/AppBarWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/TextWidget1.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/accept_button.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
class ProductAddPage extends StatefulWidget {
  @override
  _ProductAddPageState createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: AppBarWidget('HAYIRSEVER', ColorTable.blueT[1])),
            Positioned(
              left: 30,
                right: 30,
                top: 60,
                child: TextWidget('Ürün Ekle')),
            Positioned(
              top: 100,
              bottom: 0,
              child: SingleChildScrollView(
                child: Container(
                  height: Constants.getHeightValue(context, 500),
                  width: Constants.getWidth(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: Constants.getHeightValue(context, 206),
                        width: Constants.getWidthValue(context, 327),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: '#F2F2F2'.toColor(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: Constants.getWidthValue(context, 200),
                                  height: Constants.getHeightValue(context, 176),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                      border: Border.all(width: 1,color: Colors.grey)
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: '#BE0000'.toColor(),
                                      size: Constants.getWidthValue(context, 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: Constants.getHeightValue(context, 176),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    splashColor: Colors.red,
                                    onTap: (){},
                                    child: GetCamera('Fotoğraf Çek', Icons.camera_alt),
                                  ),
                                  InkWell(
                                    splashColor: Colors.red,
                                    onTap: (){},
                                    child: GetCamera('Fotoğraf Seç', Icons.photo),
                                  ),
                                  Container(
                                    height: Constants.getHeightValue(context, 56),
                                    width: Constants.getWidthValue(context, 96),
                                    child: Text(
                                      'Ürün Eklerken Dikkat Ediniz!!!'
                                    ),
                                  )
                                ],
                              ),
                            )


                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Container(
                          height: Constants.getHeightValue(context, 150),
                          width: Constants.getWidthValue(context, 327),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ürün Açıklaması',
                                style: TextStyle(
                                  color: ColorTable.blueT[5],
                                  fontSize: Constants.getHeightValue(context, 14),
                                ),
                              ),
                              TextFormField(
                                controller: controller,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                      AcceptButton('Gönder', ColorTable.blue,onTap: (){

                      },)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  GetCamera(String text,IconData iconData){
    return   Container(
      height: Constants.getHeightValue(context, 48),
      width: Constants.getWidthValue(context, 96),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: '#E2E2E2'.toColor(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            iconData,
            color: '#979797'.toColor(),
            size: Constants.getHeightValue(context, 20),
          ),
          Text(
            text,style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: Constants.getHeightValue(context, 9)
          ),
          )
        ],
      ),
    );

  }
}
