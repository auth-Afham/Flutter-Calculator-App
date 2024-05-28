import 'package:flutter/material.dart';

void main() => runApp(AlignmentTutorialApp());

class AlignmentTutorialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Alignment Tutorial'),
        ),
        body: AlignmentTutorialScreen(),
      ),
    );
  }
}

class AlignmentTutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center( // Center widget aligns its child in the center of the parent widget
      child: Column( // Column widget arranges its children vertically
        mainAxisAlignment: MainAxisAlignment.center, // Aligns children vertically centered
        crossAxisAlignment: CrossAxisAlignment.center, // Aligns children horizontally centered
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.blue,
            alignment: Alignment.center, // Aligns child content in the center of the container
            child: Text(
              'Center Alignment',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            width: 200,
            color: Colors.green,
            child: Align(
              alignment: Alignment.topLeft, // Aligns child content to the top left of the container
              child: Text(
                'Top Left Alignment',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            width: 200,
            color: Colors.orange,
            child: Align(
              alignment: Alignment.bottomRight, // Aligns child content to the bottom right of the container
              child: Text(
                'Bottom Right Alignment',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            width: 200,
            color: Colors.purple,
            child: Stack( // Stack widget allows children to be overlaid on top of each other
              children: [
                Positioned(
                  left: 20,
                  top: 20,
                  child: Text(
                    'Stacked Text 1',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Text(
                    'Stacked Text 2',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
