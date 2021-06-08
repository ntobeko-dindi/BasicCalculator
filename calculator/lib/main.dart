import 'package:flutter/material.dart';
import 'package:calculator/constants/app_colours.dart';
import 'package:calculator/constants/app_strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

Widget calculatorButton(String btnText, Color btnColuor, Color textColour) {
  return Container(
    // ignore: deprecated_member_use
    child: RaisedButton(
      onPressed: () {
        //TODO add function for button press
      },
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 35.0,
          color: textColour,
        ),
      ),
      color: btnColuor,
      padding: EdgeInsets.all(20.0),
      shape: CircleBorder(),
    ),
  );
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: AppBar(
        backgroundColor: AppColours.black,
        title: Text(AppStrings.app_name),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //calculator display
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "0",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: AppColours.white,
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //here button functions will be called where we will pass some arguments
              calculatorButton("AC", AppColours.grey, AppColours.white),
              calculatorButton("+/-", AppColours.grey, AppColours.white),
              calculatorButton("%", AppColours.grey, AppColours.white),
              calculatorButton("/", AppColours.orange, AppColours.white),
            ],
          ),
          SizedBox(height: 10.0),

          //second row of buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //here button functions will be called where we will pass some arguments
              calculatorButton("7", AppColours.grey, AppColours.white),
              calculatorButton("8", AppColours.grey, AppColours.white),
              calculatorButton("9", AppColours.grey, AppColours.white),
              calculatorButton("×", AppColours.orange, AppColours.white),
            ],
          ),
          SizedBox(height: 10.0),

          //third row of buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //here button functions will be called where we will pass some arguments
              calculatorButton("4", AppColours.grey, AppColours.white),
              calculatorButton("5", AppColours.grey, AppColours.white),
              calculatorButton("6", AppColours.grey, AppColours.white),
              calculatorButton("-", AppColours.orange, AppColours.white),
            ],
          ),
          SizedBox(height: 10.0),

          //forth row of buttons

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //here button functions will be called where we will pass some arguments
              calculatorButton("1", AppColours.grey, AppColours.white),
              calculatorButton("2", AppColours.grey, AppColours.white),
              calculatorButton("3", AppColours.grey, AppColours.white),
              calculatorButton("+", AppColours.orange, AppColours.white),
            ],
          ),
          SizedBox(height: 10.0),

          //last row of buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //here button functions will be called where we will pass some arguments
              calculatorButton("", AppColours.black, AppColours.white),
              calculatorButton("0", AppColours.grey, AppColours.white),
              calculatorButton("", AppColours.black, AppColours.white),
              calculatorButton("=", AppColours.orange, AppColours.white),
            ],
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
