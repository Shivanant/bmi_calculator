import 'package:flutter/material.dart';
import 'card.dart';

class Carddata extends StatelessWidget {
  const Carddata({required this.icon, required this.txt});
  final IconData icon;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80),
          SizedBox(height: 10),
          Text(
            txt,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
