import 'package:bmi_calculator/shared/constants.dart';
import 'package:bmi_calculator/shared/enums.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class ReusableChildCard extends StatelessWidget {
  final Gender gender;
  const ReusableChildCard({@required this.gender});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          gender == Gender.MALE ? FontAwesomeIcons.male : FontAwesomeIcons.female,
          size: 80,
          color: Color(0xFF32A852),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender == Gender.MALE  ? 'MALE' : 'FEMALE',
          style: kCostumTextStyle,
        )
      ],
    );
  }
}