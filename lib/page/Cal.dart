import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Calculator> {
  String displayText = '0';
  double num1 = 0.0;
  String operand = ' ';
  bool isoperandPressed = false;

  // Define the buildButton function here
  Widget buildButton(String buttonText) {
    return ElevatedButton(
      onPressed: () => buttonPressed(buttonText),
      style: ElevatedButton.styleFrom(
        primary: Colors.amber[100],
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
      ),
    );
  }

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'c') {
        displayText = '0';
        num1 = 0;
        operand = ' ';
        isoperandPressed = false;
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        if (!isoperandPressed) {
          num1 = double.parse(displayText);
          operand = buttonText;
          isoperandPressed = true;
          displayText = '';
        }
      } else if (buttonText == '=') {
        double num2 = double.parse(displayText);
        double result = 0.0;
        switch (operand) {
          case '+':
            result = num1 + num2;
            break;
          case '-':
            result = num1 - num2;
            break;
          case '*':
            result = num1 * num2;
            break;
          case '/':
            result = num1 / num2;
            break;
          default:
            result = 0.0;
        }
        if (result % 1 == 0) {
          displayText = result.toInt().toString();
        } else {
          displayText = result.toString();
        }
        isoperandPressed = false;
      } else {
        if (displayText == '0') {
          displayText = buttonText;
        } else {
          displayText += buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      appBar: AppBar(
          backgroundColor: Colors.amber[600],
          title: Text(
            "Calculator",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          )),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Expanded(
          child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(displayText,
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButton('7'),
            buildButton('8'),
            buildButton('9'),
            buildButton('c'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButton('4'),
            buildButton('5'),
            buildButton('6'),
            buildButton('*'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButton('1'),
            buildButton('2'),
            buildButton('3'),
            buildButton('-'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButton('/'),
            buildButton('0'),
            buildButton('.'),
            buildButton('+'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButton('='),
          ],
        ),
      ]),
    );
  }
}
