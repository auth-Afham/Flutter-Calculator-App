import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp()); // Entry point of the application
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator', // Title of the application
      theme: ThemeData(
        primarySwatch: Colors.blue, // Theme color
      ),
      home: CalculatorHomePage(), // Home page of the application
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState(); // Creates the state for the CalculatorHomePage
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String output = "0"; // Displayed output on the calculator screen
  String _output = "0"; // Internal output to handle calculations
  double num1 = 0.0; // First operand
  double num2 = 0.0; // Second operand
  String operand = ""; // Operator (+, -, *, /)

  // Method to handle button presses
  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      // Clear all values if CLEAR button is pressed
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*") {
      // If an operator is pressed, store the first operand and operator
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      // Handle decimal point
      if (_output.contains(".")) {
        print("Already contains a decimal");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      // Calculate the result if = is pressed
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      // Reset operands and operator after calculation
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      // Append the pressed button value to the output
      _output = _output + buttonText;
    }

    // Update the displayed output
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  // Method to build calculator buttons
  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => buttonPressed(buttonText), // Handle button press
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"), // Title of the AppBar
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight, // Align the text to the right
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0), // Padding for the container
            child: Text(
              output, // Display the current output
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(), // Divider between the display and buttons
          ),
          Column(
            children: [
              // First row of buttons
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              // Second row of buttons
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*"),
                ],
              ),
              // Third row of buttons
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              // Fourth row of buttons
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ],
              ),
              // Fifth row of buttons
              Row(
                children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
