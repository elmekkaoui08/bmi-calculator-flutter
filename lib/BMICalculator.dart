
import 'package:flutter/material.dart';
import 'dart:math';
class BMICalculator {
  final int height;
  final int weight;
  double _bmi;

   BMICalculator({@required this.height,@required this.weight});

  String getBMICalculation(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMITextResult(){
    if(_bmi > 25)
      return 'OVERWEIGHT';
    else if(_bmi > 18.5)
      return 'NORMAL';
    else
      return 'UNDERWEIGHT';
  }

  String getInterpetation(){
    if(_bmi > 25)
      return 'Your Body Mass Index is overweight, try to exercise more !';
    else if(_bmi > 18.5)
      return 'Congrats! you have a good Body Mass Index, keep it up.';
    else
      return 'Oh god! that\'s not good, not good at all, try to eat more!';
  }
}