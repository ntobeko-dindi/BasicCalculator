import 'package:calculator/pages/history.dart';
import 'package:flutter/material.dart';
import 'package:calculator/constants/app_colours.dart';
import 'package:calculator/constants/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class _CalculatorState extends State<Calculator> {
  Widget calculatorButton(String btnText, Color btnColuor, Color textColour) {
    return Container(
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {
          calculation(btnText);
        },
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: btnText == '=' ? 70.0 : 35.0,
            color: textColour,
          ),
        ),
        color: btnColuor,
        padding: btnText == '='
            ? EdgeInsets.fromLTRB(71, 0, 71, 0)
            : EdgeInsets.all(20.0),
        shape: btnText == '=' ? StadiumBorder() : CircleBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: AppBar(
        backgroundColor: AppColours.grey,
        title: Text(AppStrings.app_name),
        actions: [
          Container(
            color: AppColours.black,
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              iconSize: 35,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => History()),
                );
              },
            ),
          ),
        ],
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
                  opr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColours.white,
                    fontSize: 40.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  text,
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
              calculatorButton("AC", AppColours.red, AppColours.white),
              calculatorButton("%", AppColours.red, AppColours.white),
              calculatorButton("del", AppColours.red, AppColours.white),
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
              calculatorButton("0", AppColours.grey, AppColours.white),
              calculatorButton(".", AppColours.grey, AppColours.white),
              calculatorButton("=", AppColours.darkerOrage, AppColours.white),
            ],
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  //Calculator logic
  dynamic text = '0';
  dynamic prev = '';
  double numOne = 0;
  double prevNumOne = 0;
  bool numOneAdded = false;
  double numTwo = 0;
  String history = '';

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  bool oprAdded = false;
  dynamic preOpr = '';

  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      prev = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      print("\n\n\nhistory is : " + history + '\n\n\n');

      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == '×') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
      numOne = 0;
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == '×' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }
      prevNumOne = numOne;
      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == '×') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }

      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
      if (numOne > 0.0 && !numOneAdded) {
        numOneAdded = true;
        if (isInteger(numOne)) {
          prev += (numOne.toInt()).toString() + opr;
        } else {
          prev += numOne.toString() + opr;
        }
      } else {
        if (opr == '+' && !oprAdded) {
          oprAdded = true;
          prev += opr;
        }
        if (numTwo > 0.0) {
          if (isInteger(numTwo)) {
            prev += (numTwo.toInt()).toString();
          } else {
            prev += numTwo.toString();
          }
        }
      }
      if (numOne != 0.0 && numTwo != 0) {
        history += '\n' +
            prevNumOne.toString() +
            ' ' +
            preOpr.toString() +
            ' ' +
            numTwo.toString() +
            '\n= ' +
            finalResult;
        writeToPrefs();
      }
    });
  }

  void writeToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("history", history);
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

  //check if a value can be converted to integer

  bool isInteger(num value) => value is int || value == value.roundToDouble();
}
