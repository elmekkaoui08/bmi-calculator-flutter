import 'package:bmi_calculator/pages/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
      theme:darkThemeData(),

    );
  }
}

ThemeData darkThemeData(){
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0xFF0A0D22),
    primaryColor: Color(0xFF0A0D22),
  );
}