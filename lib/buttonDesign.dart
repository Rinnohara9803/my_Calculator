import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Firstbutton extends StatelessWidget {
  Firstbutton(this.buttonName, this.buttonColor, this.callBack);

  final String buttonName;
  final Color buttonColor;
  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Neumorphic(
        style: NeumorphicStyle(
          shadowLightColor: Colors.purple,
          shadowDarkColor: Colors.red,
          depth: 1,
          intensity: 5,
          color: buttonColor,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(35.0),
          ),
          border: NeumorphicBorder(color: Colors.blue, width: 1),
        ),
        child: GestureDetector(
          onTap: () {
            callBack(buttonName);
          },
          child: Container(
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            height: 70,
            width: 85,
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
class Lastbutton extends StatelessWidget {
  Lastbutton(this.buttonName, this.buttonColor, this.callBack);

  final String buttonName;
  final Color buttonColor;
  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBack(buttonName);
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Neumorphic(
          style: NeumorphicStyle(
            shadowLightColor: Colors.purple,
            shadowDarkColor: Colors.red,
            depth: 1,
            intensity: 5,
            color: buttonColor,
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(35.0),
            ),
            border: NeumorphicBorder(color: Colors.blue, width: 1),
          ),
          child: Container(
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            height: 145,
            width: 85,
          ),
        ),
      ),
    );
  }
}
