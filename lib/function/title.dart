import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp()); // Entry point of the Flutter application
}

class MainApp extends StatelessWidget {
  const MainApp({super.key}); // Constructor for MainApp widget

  final bool showError = false; // Boolean flag to toggle error message

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp provides basic app structure and themes
      home: Scaffold( // Scaffold provides app layout structure
        appBar: AppBar(
          title: const Text('Flutter App'), // Title of the app bar
        ),
        body: Center( // Centers the content in the middle of the screen
          child: showError // Conditional widget based on showError flag
              ? Text('Error! Something went wrong.') // Error message if showError is true
              : Text('Hello World!'), // Default message if showError is false
        ),
      ),
    );
  }
}
