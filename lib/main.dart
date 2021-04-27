import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:my_firstcalculator/buttonDesign.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String theEquation = '0';
  String theResult = '0';
  String theExpression;

  double theEquationFontSize = 40.0;
  double theResultFontSize = 60.0;
  Color theResultColor;
//------------------------------------------------------------------------------

  String theThemeDataText = 'switch to dark theme';
  ThemeData theThemeData = ThemeData.light();
  bool isSwitched = false;

//------------------------------------------------------------------------------

  void buttonPressed(String buttonGame) {
    setState(() {
      if (theEquation.length > 18) {
        theResult = 'Max Number \'18\' exceeded.';
        theResultFontSize = 20.0;
        // theResultColor = Colors.blueAccent;
        theEquation = '0';
      } else {
        if (buttonGame == 'AC') {
          theEquation = '0';
          theResult = '0';
          theEquationFontSize = 40.0;
          theResultFontSize = 60.0;
        } else if (buttonGame == '=') {
          theEquationFontSize = 40.0;
          theResultFontSize = 50.0;

          theExpression = theEquation;

          try {
            Parser p = Parser();
            Expression exp = p.parse(theExpression);
            ContextModel cm = ContextModel();
            theResult = '${exp.evaluate(EvaluationType.REAL, cm)}';
          } catch (e) {
            theResult = 'Error';
          }
        } else if (buttonGame == '⨂') {
          theEquationFontSize = 60.0;
          theResultFontSize = 40.0;
          theEquation = theEquation.substring(0, theEquation.length - 1);
        } else {
          if (theEquation == '0') {
            theEquation = buttonGame;
          } else {
            theEquation = theEquation + buttonGame;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theThemeData,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    theEquation,
                    style: TextStyle(fontSize: theEquationFontSize),
                  ),
                ),
                margin: EdgeInsets.all(5.0),
                color: Colors.white10,
                height: 90.0,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    theResult,
                    style: TextStyle(
                        color: theResultColor,
                        fontSize: theResultFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
                color: Colors.white70,
                height: 90.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Switch(
                      value: isSwitched,
                      onChanged: (bool state) {
                        setState(() {
                          if (isSwitched == false) {
                            isSwitched = true;
                            theThemeData = ThemeData.dark();
                            theThemeDataText = 'switch to light theme';
                          } else {
                            isSwitched = false;
                            theThemeData = ThemeData.light();
                            theThemeDataText = 'switch to dark theme';
                          }
                        });
                      },
                    ),
                    Text(
                      theThemeDataText.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Firstbutton('\⨂', Color(0xFFF9B52C), buttonPressed),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Firstbutton('AC', Color(0xFF48315B), buttonPressed),
                        Firstbutton('{', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('7', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('4', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('1', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('0', Color(0xFFF9B52C), buttonPressed)
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Firstbutton('(', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('}', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('8', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('5', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('2', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('00', Color(0xFFF9B52C), buttonPressed)
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Firstbutton(')', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('.', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('9', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('6', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('3', Color(0xFFF9B52C), buttonPressed),
                        Firstbutton('000', Color(0xFFF9B52C), buttonPressed)
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Firstbutton('*', Color(0xFF48315B), buttonPressed),
                        Firstbutton('\/', Color(0xFF48315B), buttonPressed),
                        Firstbutton('-', Color(0xFF48315B), buttonPressed),
                        Firstbutton('+', Color(0xFF48315B), buttonPressed),
                        Lastbutton('=', Color(0xFFF9B52C), buttonPressed),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
