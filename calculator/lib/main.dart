import 'package:calculator/pages/history.dart';
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

  Widget equalButton(String btnText, Color btnColuor, Color textColour) {
    return Container(
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {
          //TODO add function for button press
        },
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 70.0,
            color: textColour,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: btnColuor,
        padding: EdgeInsets.fromLTRB(71, 0, 71, 0),
        shape: StadiumBorder(),
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
              calculatorButton("AC", AppColours.grey, AppColours.white),
              calculatorButton("C", AppColours.grey, AppColours.white),
              calculatorButton("del", AppColours.grey, AppColours.white),
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
              equalButton("=", AppColours.darkerOrage, AppColours.white),
            ],
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  //Calculator logic
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
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
    });
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
}
