import 'package:flutter/material.dart';

class ReUsableCard extends StatelessWidget {
  const ReUsableCard(
      {Key? key, this.colour, this.cardChild, required this.onPress})
      : super(key: key);

  final Color? colour;
  final Widget? cardChild;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
