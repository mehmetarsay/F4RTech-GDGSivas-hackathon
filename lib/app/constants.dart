import 'package:flutter/material.dart';

class Constants{
  static double getWidthValue(BuildContext context,double size) {
    return MediaQuery.of(context).size.width * size/375;
  }
  static double getHeightValue(BuildContext context,double size) {
    return MediaQuery.of(context).size.height * size/667;
  }
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}