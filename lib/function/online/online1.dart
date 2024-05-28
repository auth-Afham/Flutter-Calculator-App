import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Multiplayer Game'),
      ),
      body: StreamBuilder(
        stream: firestore.collection('game_state').doc('current').snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // Check if snapshot has data
          if (snapshot.hasData && snapshot.data!.exists) {
            // Access the data safely
            var data = snapshot.data!.data() as Map<String, dynamic>;
            var gameState = data['state']; // Example: accessing 'state' field

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Game State: $gameState'),
                  ElevatedButton(
                    onPressed: () {
                      // Implement game logic here
                    },
                    child: Text('Start Game'),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}
