import 'package:flutter/material.dart';
import 'const.dart';

class Roundactionbtn extends StatelessWidget {
  const Roundactionbtn({required this.icon, required this.operation});
  final IconData icon;
  final Function operation;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        fillColor: appbarcolor,
        constraints: BoxConstraints.tightFor(width: 56, height: 56),
        shape: CircleBorder(),
        onPressed: operation());
  }
}
