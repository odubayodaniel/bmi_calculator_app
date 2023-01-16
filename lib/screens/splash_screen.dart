import 'dart:async';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/widgets/constants.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);

    controller.forward();

    Timer(
      const Duration(seconds: 5),
          () => Navigator.of(context).pushReplacement(
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, __) {
              return FadeTransition(
                opacity: animation,
                child: const InputPage(),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenAwareSize(dynamic i, BuildContext context) {}
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ScaleTransition(
          scale: animation,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              Image(
                image: const AssetImage(
                  "assets/images/images.png",
                ),
                height: screenAwareSize(80, context),
                width: screenAwareSize(66.68, context),
              ),

              const SizedBox(height: 10.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("BMICalc", style: kSplashTextStyle),
                ],
              ),
            ],
          ),),),
    );
  }
}