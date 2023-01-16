import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({ Key? key, this.icon, this.label }) : super(key: key);

  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 13.0,
        ),
        Text(
          label!,
          style:kLabelTextStyle,
        )
      ],
    );
  }
}
