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
            return CircularProgressIndicator();
          }

          var data = snapshot.data!.data();
          // Use data to update game UI
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Game State: ${data['state']}'),
                ElevatedButton(
                  onPressed: () {
                    // Implement game logic here
                  },
                  child: Text('Start Game'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
