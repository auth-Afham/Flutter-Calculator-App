import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp()); // Calls the CounterApp widget
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0; // Declare a variable to hold the counter value

  void _incrementCounter() {
    setState(() {
      _counter++; // Increment the counter value
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--; // Decrement the counter value
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'), // Title of the app bar
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Counter Value: $_counter', // Display the current counter value
                style: const TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 16.0), // Add some spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _decrementCounter, // Call _decrementCounter when pressed
                    child: const Text('-'),
                  ),
                  const SizedBox(width: 16.0), // Add some spacing
                  ElevatedButton(
                    onPressed: _incrementCounter, // Call _incrementCounter when pressed
                    child: const Text('+'),
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