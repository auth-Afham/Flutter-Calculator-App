import 'package:flutter/material.dart';

// Entry point of the Flutter application
void main() {
  runApp(const MainApp());
}

// MainApp widget which is a stateless widget
class MainApp extends StatelessWidget {
  // Constructor for MainApp with an optional key parameter
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return const MaterialApp(
      // MaterialApp provides basic app structure and themes
      home: Scaffold(
        // Scaffold provides app layout structure
        body: Center(
          // Centers the content in the middle of the screen
          child: Text('Hello World!'), // Displays "Hello World!" text
        ),
      ),
    );
  }
}
