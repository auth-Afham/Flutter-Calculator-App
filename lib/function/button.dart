import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp()); // Entry point of the Flutter application
}

class MainApp extends StatefulWidget {
  const MainApp({super.key}); // Constructor for MainApp widget

  @override
  State<MainApp> createState() => _MainAppState(); // Creates state for MainApp
}

class _MainAppState extends State<MainApp> {
  String _displayText = 'Hello World!'; // Initial text to display

  // Method to change the text when the button is pressed
  void _changeText() {
    setState(() {
      _displayText = 'Text changed!'; // Updates the text displayed
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'), // Title of the app bar
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_displayText), // Displays the current text
              const SizedBox(height: 16.0), // Spacer between Text and Button
              ElevatedButton(
                onPressed: _changeText, // Calls _changeText method when pressed
                child: const Text('Change Text'), // Text displayed on the Button
              ),
            ],
          ),
        ),
      ),
    );
  }
}
