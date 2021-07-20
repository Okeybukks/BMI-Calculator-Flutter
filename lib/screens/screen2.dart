import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/custom_widgets.dart';
import '../components/bottombutton.dart';

class Result extends StatelessWidget {
  final String bmiResult;
  final String bmiCategory;
  final String bmiInterpretation;

  Result({@required this.bmiCategory, @required this.bmiInterpretation, @required this.bmiResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Text('Your Result', style: kResultHeaderText,)),
          Expanded(child: CustomCard(
            cardColor: kActiveColor,
            customChild: Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(bmiCategory, style: kResultTextStyle,),
                  Text(bmiResult, style: kBMITextStyle,),
                  Column(
                    children: [
                      Text('Normal BMI range:', style: kLabelTextStyle, ),
                      SizedBox(height: 10,),
                      Text('18.5 - 25 kg/m2',  style: kDefaultTextStyle,)
                    ],
                  ),
                  Text(bmiInterpretation, style: kDefaultTextStyle, textAlign: TextAlign.center,),
                  TextButton(
                    onPressed: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: kInactiveColor,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Text('SAVE RESULT')),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                  )
                ]
              ),
            ),
          )),
          SubmitButton(
            customFunc: (){Navigator.pop(context);},
            buttonText: 'Re-calculate',),
        ],
      ),
    );
  }
}


