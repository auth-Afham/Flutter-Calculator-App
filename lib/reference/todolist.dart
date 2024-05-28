import 'package:flutter/material.dart';

// Entry point of the Flutter application
void main() {
  runApp(TodoApp());
}

// StatefulWidget for the TodoApp
class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState(); // Creates the mutable state
}

// State class for TodoApp
class _TodoAppState extends State<TodoApp> {
  List<String> todos = []; // List to hold todo items
  TextEditingController todoController = TextEditingController(); // Controller for the TextField

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return MaterialApp(
      title: 'Todo List', // Title of the application
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo List'), // Title of the app bar
        ),
        body: Column(
          children: [
            Expanded(
              // Expanded widget to take up remaining space
              child: ListView.builder(
                itemCount: todos.length, // Number of items in the list
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todos[index]), // Display the todo item text
                    trailing: IconButton(
                      icon: Icon(Icons.delete), // Delete icon button
                      onPressed: () {
                        setState(() {
                          todos.removeAt(index); // Remove the item from the list
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0), // Padding around the TextField
              child: TextField(
                controller: todoController, // Controller for the TextField
                decoration: InputDecoration(
                  hintText: 'Enter a new todo', // Placeholder text
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add), // Add icon button
                    onPressed: () {
                      setState(() {
                        todos.add(todoController.text); // Add the new todo item to the list
                        todoController.clear(); // Clear the TextField
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
