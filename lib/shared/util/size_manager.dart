import 'package:flutter/material.dart';

class SizeManager {
  static late Size _sizeData;
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;
  static late Brightness brightness;
  void init(BuildContext context) {
    _sizeData = MediaQuery.sizeOf(context);
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _sizeData.width;
    screenHeight = _sizeData.height;
    orientation = _mediaQueryData.orientation;
    brightness = _mediaQueryData.platformBrightness;
  }
  static double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = SizeManager.screenHeight;
    return (inputHeight / 800.0) * screenHeight;
  }

  static double getProportionateScreenWidth(double inputHeight) {
    double screenWidth = SizeManager.screenWidth;
    return (inputHeight / 360.0) * screenWidth;
  }

}
