import 'package:flutter/material.dart';
import 'card.dart';
import 'const.dart';

const tile =
    TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w700);

class Resultpage extends StatelessWidget {
  Resultpage({required this.bmi, required this.status});
  final String bmi;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                card(
                    cardChild: Text(status, style: tile),
                    colour: inactivetile,
                    onPressed: () {}),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 20,
              )
            ],
          ),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                card(
                    cardChild: Text(
                      bmi,
                      style: tile,
                    ),
                    colour: inactivetile,
                    onPressed: () {})
              ])),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(child: Text('Calculate Again', style: kstylebtn)),
              height: 100,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color(0xffDDE6ED),
                  borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
