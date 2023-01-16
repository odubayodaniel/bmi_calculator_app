import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMIcal());
}

class BMIcal extends StatelessWidget {
  const BMIcal({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const Splash(),
    );
  }
}
