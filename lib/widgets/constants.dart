import 'package:flutter/material.dart';

class CalculatorColor {
  static const kActiveColor = Color(0x31949191);
  static const kInActiveColor = Color(0XFF111328);
  static const kBottomContainerColor = Color(0xFFEB1555);
  static const kBottomContainerHeight = 87.0;
  static const kSliderInactiveColor = Color(0XFF8D8E98);
  static const kSliderActiveColor = Color(0XFFFFFFFF);
  static const kSliderThumbColor = Color(0xFFEB1555);
  static const kSliderOverlayColor = Color(0X15EB1555);
}

late final String? label;

const kLabelTextStyle = TextStyle(
  fontSize: 17.0,
  color: Color(0xFF8D8E98),
);

const kNumberTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);
const kCalculateButtonTextStyle =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w500);
const kResultHeaderTextStyle =
    TextStyle(fontSize: 40, fontWeight: FontWeight.w700);
const kResultTexStyle = TextStyle(
    color: Color(0xFF24D875), fontWeight: FontWeight.bold, fontSize: 24.0);
const kBMITextStyle = TextStyle(fontSize: 90.0, fontWeight: FontWeight.bold);
const kBodyTextStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
const kSplashTextStyle = TextStyle(
  fontSize: 24.0,
  color: CalculatorColor.kInActiveColor,
);
enum Gender {
  male,
  female,
}
