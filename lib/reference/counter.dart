import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp()); // Calls the CounterApp widget to start the application
}

// A StatefulWidget for the CounterApp
class CounterApp extends StatefulWidget {
  const CounterApp({super.key}); // Constructor for CounterApp

  @override
  State<CounterApp> createState() => _CounterAppState(); // Creates the mutable state for CounterApp
}

// State class for CounterApp
class _CounterAppState extends State<CounterApp> {
  int _counter = 0; // Declare a variable to hold the counter value

  // Method to increment the counter value
  void _incrementCounter() {
    setState(() {
      _counter++; // Increment the counter value and update the UI
    });
  }

  // Method to decrement the counter value
  void _decrementCounter() {
    setState(() {
      _counter--; // Decrement the counter value and update the UI
    });
  }

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'), // Title of the app bar
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
            children: [
              Text(
                'Counter Value: $_counter', // Display the current counter value
                style: const TextStyle(fontSize: 24.0), // Text style with font size
              ),
              const SizedBox(height: 16.0), // Add some vertical spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the row horizontally
                children: [
                  ElevatedButton(
                    onPressed: _decrementCounter, // Call _decrementCounter when pressed
                    child: const Text('-'), // Text on the button
                  ),
                  const SizedBox(width: 16.0), // Add some horizontal spacing
                  ElevatedButton(
                    onPressed: _incrementCounter, // Call _incrementCounter when pressed
                    child: const Text('+'), // Text on the button
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
