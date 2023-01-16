import 'package:flutter/material.dart';

import 'constants.dart';

class CalculateResultButton extends StatelessWidget {
  const CalculateResultButton({Key? key, this.text, this.onPressed})
      : super(key: key);
  final String? text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(30.0),
        child: Text(
          '$text',
          style: kCalculateButtonTextStyle,
        ),
        color: CalculatorColor.kBottomContainerColor,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10.0),
        alignment: Alignment.bottomCenter,
        height: CalculatorColor.kBottomContainerHeight,
      ),
    );
  }
}
