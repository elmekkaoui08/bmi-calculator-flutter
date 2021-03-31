import 'package:bmi_calculator/pages/input_page.dart';
import 'package:bmi_calculator/shared/constants.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String bmiTextResult;
  final String interpretation;

  ResultsPage({@required this.bmiResult,@required this.bmiTextResult,@required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
            'Your BMI Results',
            style: kTitleTextStyle,
          ),
              )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                color: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(bmiTextResult, style: kResultTextStyle),
                    Text(bmiResult, style: kResultNumberStyle,),
                    Text(interpretation, textAlign: TextAlign.center, style: kResultBodyStyle,)
                  ],
                ),
              )
          ),
         BottomButton(text: 're-calculate', onTap: () {
           Navigator.pop(context);

         })
        ],
      ),
    );
  }
}
