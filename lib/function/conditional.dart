import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp()); // Entry point of the Flutter application
}

class MainApp extends StatelessWidget {
  const MainApp({super.key}); // Constructor for MainApp widget

  final bool showError = false; // Boolean flag to toggle error message
  final bool showWarning = false; // Boolean flag to toggle warning message

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp provides basic app structure and themes
      home: Scaffold( // Scaffold provides app layout structure
        appBar: AppBar(
          title: const Text('Flutter App'), // Title of the app bar
        ),
        body: Center( // Centers the content in the middle of the screen
          child: _buildMessage(), // Call _buildMessage method to display appropriate message
        ),
      ),
    );
  }

  Widget _buildMessage() {
    if (showError) {
      return Text('Error! Something went wrong.'); // Display error message
    } else if (showWarning) {
      return Text('Warning! Be careful.'); // Display warning message
    } else {
      return Text('Hello World!'); // Default message if no conditions are met
    }
  }
}
