import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card(
      {required this.cardChild, required this.colour, required this.onPressed});
  final Widget cardChild;
  final Color colour;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15),
        child: cardChild,
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
