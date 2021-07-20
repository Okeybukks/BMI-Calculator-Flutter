import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/custom_widgets.dart';
import '../constants.dart';
import 'screen2.dart';
import '../components/bottombutton.dart';
import '../components/roundbutton.dart';
import 'package:bmi_calculator/bmi_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 70;
  int age = 20;

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: CustomCard(
                        cardColor: selectedGender == Gender.male
                            ? kActiveColor
                            : kInactiveColor,
                        customChild: CustomIcon(
                          icon: FontAwesomeIcons.mars,
                          text: 'MALE',
                        ),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 0,
                    ),
                    Expanded(
                      child: CustomCard(
                        cardColor: selectedGender == Gender.female
                            ? kActiveColor
                            : kInactiveColor,
                        customChild: CustomIcon(
                          icon: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: CustomCard(
                    cardColor: kActiveColor,
                    customChild: CustomColumn(
                        bodyProperty: 'height',
                        bodyPropertyUnit: 'cm',
                        bodyPropertyValue: height,
                        customChild: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15,
                              ),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 30,
                              ),
                            trackHeight: 2.0,
                              thumbColor: kBottomContainerColorCode,
                              overlayColor: Color(0x29EB1555),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xFF111328),),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120,
                              max: 220,
                              onChanged: (double val) {
                                setState(() {
                                  height = val.round();
                                });
                              }),
                        )))),
            Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: CustomCard(
                          cardColor: kActiveColor,
                          customChild: CustomColumn(
                            bodyProperty: 'weight',
                            bodyPropertyUnit: 'kg',
                            bodyPropertyValue: weight,
                            customChild: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundButton(iconValue: FontAwesomeIcons.minus,
                                  onPress: (){
                                    setState(() {
                                      weight -= 1;
                                    });
                                  },),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundButton(iconValue: FontAwesomeIcons.plus,
                                  onPress: (){
                                    setState(() {
                                      weight += 1;
                                    });
                                  },),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 0,
                    ),
                    Expanded(
                      child: CustomCard(
                          cardColor: kActiveColor,
                          customChild: CustomColumn(
                            bodyProperty: 'age',
                            bodyPropertyValue: age,
                            bodyPropertyUnit: '',
                            customChild: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundButton(iconValue: FontAwesomeIcons.minus,
                                  onPress: (){
                                    setState(() {
                                      age -= 1;
                                    });
                                  },),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundButton(iconValue: FontAwesomeIcons.plus,
                                  onPress: (){
                                    setState(() {
                                      age += 1;
                                    });
                                  },),
                              ],
                            ),
                          )),
                    ),
                  ],
                )),
            SubmitButton(
              customFunc: (){
                BMIBrain brain = BMIBrain(weight: weight, height: height);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> Result(
                    bmiResult: brain.bmiCalculate(),
                    bmiInterpretation: brain.getInterpretation(),
                    bmiCategory: brain.bmiCategory(),
                  )));},
              buttonText: 'Calculate',),
          ],
        ),
      ),
    );
  }
}


