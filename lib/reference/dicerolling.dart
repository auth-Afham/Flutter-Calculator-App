import 'dart:math'; // Importing the math library for random number generation
import 'package:flutter/material.dart'; // Importing the Flutter material library

// Entry point of the Flutter application
void main() {
  runApp(DiceRollerApp());
}

// StatefulWidget for the DiceRollerApp
class DiceRollerApp extends StatefulWidget {
  @override
  _DiceRollerAppState createState() => _DiceRollerAppState(); // Creates the mutable state
}

// State class for DiceRollerApp
class _DiceRollerAppState extends State<DiceRollerApp> {
  int diceValue = 1; // Initial value of the dice

  // Method to roll the dice and update the diceValue
  void rollDice() {
    setState(() {
      diceValue = Random().nextInt(6) + 1; // Generate a random number between 1 and 6
    });
  }

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return MaterialApp(
      title: 'Dice Roller', // Title of the application
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dice Roller'), // Title of the app bar
        ),
        body: Center(
          // Centers the content in the middle of the screen
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centers the children vertically
            children: [
              Image.asset(
                'assets/dice$diceValue.png', // Load the dice image based on the current value
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20), // Spacer between the image and the button
              ElevatedButton(
                onPressed: rollDice, // Calls rollDice method when pressed
                child: Text('Roll Dice'), // Text displayed on the button
              ),
            ],
          ),
        ),
      ),
    );
  }
}
