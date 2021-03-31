import 'dart:ffi';

import 'package:bmi_calculator/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/pages/input_page.dart';

class BottomCard extends StatelessWidget {
  final String subTitle;
  final int feature;
  final Function onAddPress;
  final Function onMinusPress;
  BottomCard({@required this.subTitle, @required this.feature, @required this.onAddPress, @required this.onMinusPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          subTitle,
          style: kCostumTextStyle,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '$feature',
                style: kValueTextStyle,
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedIconButton(icon: FontAwesomeIcons.minus, onPressed: onMinusPress),
              SizedBox(width: 20,),
             RoundedIconButton(icon: FontAwesomeIcons.plus, onPressed: onAddPress),
            ],
          ),
        )
      ],
    );
  }
}


class RoundedIconButton extends StatelessWidget {

  final IconData icon;
  final Function onPressed;

  RoundedIconButton({@required this.icon, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
      shape: CircleBorder(),
      fillColor: Color(0xFF32A852),
    );
  }
}
