import 'package:flutter/material.dart';
import '../constants.dart';

class SubmitButton extends StatelessWidget {
  final String buttonText;
  final Function customFunc;
  SubmitButton({@required this.customFunc, @required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: customFunc,
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Center(
          child: Text(buttonText.toUpperCase(),
            style: kLargeButtonStyle,),),
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColorCode,
        margin: EdgeInsets.only(top: 5),
      ),
    );
  }
}