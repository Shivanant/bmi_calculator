import 'package:flutter/material.dart';

class Bmibrane {
  Bmibrane({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0;

  String getBmi() {
    double heightm = height / 100;

    _bmi = weight / (heightm * heightm);
    return _bmi.toString().substring(0, 5);
  }

  String getCondition() {
    if (_bmi >= 25) {
      return "overweight".toUpperCase();
    } else if (_bmi >= 18.5) {
      return "normal".toUpperCase();
    } else {
      return "under weight";
    }
  }
}
