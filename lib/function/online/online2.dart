import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:firebase_database/firebase_database.dart'; // Import Firebase Realtime Database

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat App',
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController(); // Controller for the message input field
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref('messages'); // Reference to the 'messages' node in the Realtime Database
  List<Message> _messages = []; // List to store received messages

  @override
  void initState() {
    super.initState();
    _databaseReference.onChildAdded.listen(_onMessageAdded); // Listen for new messages in the database
  }

  void _onMessageAdded(DatabaseEvent event) {
    // Handle new message events
    setState(() {
      _messages.add(Message.fromJson(event.snapshot.value as Map<dynamic, dynamic>));
    });
  }

  void _sendMessage() {
    // Send a new message to the database
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      _databaseReference.push().set({'text': message}); // Push a new message node with the message text
      _messageController.clear(); // Clear the input field
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index].text), // Display the message text
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Enter a message',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendMessage, // Send the message when the send button is pressed
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text; // Message text

  Message({required this.text});

  factory Message.fromJson(Map<dynamic, dynamic> json) {
    // Create a Message instance from a JSON object
    return Message(text: json['text']);
  }
}