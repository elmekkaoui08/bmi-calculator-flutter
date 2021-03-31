import 'package:bmi_calculator/BMICalculator.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/shared/constants.dart';
import 'package:bmi_calculator/shared/enums.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/bottom_card.dart';
import 'package:bmi_calculator/widgets/reusable_child_card.dart';
import 'package:flutter/material.dart';

_InputPageState inputPageState;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() {
    inputPageState = _InputPageState();
    return inputPageState;
  }
}

int age = 10;
int weight = 37;
Gender selectedGender;

class _InputPageState extends State<InputPage> {
  int height = 100;

  Color maleCardColor = kInactiveColor;
  Color femaleCardColor = kInactiveColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                    color: selectedGender == Gender.MALE
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: ReusableChildCard(gender: Gender.MALE),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                    color: selectedGender == Gender.FEMALE
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: ReusableChildCard(
                      gender: Gender.FEMALE,
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
                child: ReusableCard(
              color: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kCostumTextStyle,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: kValueTextStyle,
                        ),
                        Text(
                          ' cm',
                          style: kCostumTextStyle,
                        ),
                      ],
                    ),
                  ),
                  /* Row(
                  children: [
                    Text('$height', style: TextStyle(fontSize: 100, color: Colors.white),),
                    Text('cm')
                  ],
                ),*/
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: Color(0xFF32A852),
                      overlayColor: Color(0x2932A852),
                      inactiveTrackColor: Colors.grey,
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                      // activeColor: Color(0xFF32A852),
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                      min: 100,
                      max: 220,
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  color: kCardColor,
                  cardChild: BottomCard(
                    subTitle: 'WEIGHT',
                    feature: weight,
                    onAddPress: () {
                      setState(() {
                        weight++;
                      });
                    },
                    onMinusPress: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  color: kCardColor,
                  cardChild: BottomCard(
                    subTitle: 'AGE',
                    feature: age,
                    onAddPress: () {
                      setState(() {
                        age++;
                      });
                    },
                    onMinusPress: () {
                      setState(() {
                        age--;
                      });
                    },
                  ),
                )),
              ],
            )),
            BottomButton(text: 'CALCULATE', onTap: (){
              BMICalculator bmiCal= BMICalculator(height: height, weight: weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiResult: bmiCal.getBMICalculation(),
                    bmiTextResult: bmiCal.getBMITextResult(),
                    interpretation: bmiCal.getInterpetation(),)));

            },)
          ],
        ));
  }
}

class BottomButton extends StatelessWidget {

  final String text;
  final Function onTap;

  const BottomButton({@required this.text, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF32A852),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15))),
        width: double.infinity,
        height: 80,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 30, color: Color(0xFF181A2E)),
          ),
        ),
      ),
    );
  }
}
