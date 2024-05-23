import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp()); // Entry point of the Flutter application
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController _textController = TextEditingController(); // Controller for handling text input

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _textController, // Connects the controller to the TextField
                  decoration: const InputDecoration(
                    hintText: 'Enter some text', // Placeholder text for the TextField
                  ),
                ),
              ),
              const SizedBox(height: 16.0), // Spacer between TextField and Button
              ElevatedButton(
                onPressed: () {
                  // Handle the input text here
                  final inputText = _textController.text; // Get the text from the TextField
                  print('Input text: $inputText'); // Print the input text to console
                },
                child: const Text('Submit'), // Text displayed on the Button
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose(); // Dispose of the TextEditingController when done
    super.dispose();
  }
}
