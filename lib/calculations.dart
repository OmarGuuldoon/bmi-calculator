import 'dart:math';

import 'package:flutter/cupertino.dart';

class Calculator {
  Calculator({@required this.height, @required this.weight});

  int height;
  int weight;
  double _bmi;

  String calculate_bmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String Description() {
    if (_bmi >= 25) {
      return 'you are far more than the normal body bmi so please make some exercises ';
    } else if (_bmi > 18.5) {
      return 'you have normal body mass , !good job';
    } else {
      return ' you have less body mass than expected , so please eat more and think about your diet';
    }
  }
}
