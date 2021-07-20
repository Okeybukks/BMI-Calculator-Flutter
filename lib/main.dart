import 'package:flutter/material.dart';
import 'screens/input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        // cardTheme: CardTheme(
        //   color: Color(0xFF1D1E33)
        // )
      ),
      home: InputPage(),
    );
  }
}


