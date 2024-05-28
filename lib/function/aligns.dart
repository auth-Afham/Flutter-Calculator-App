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
        body: SingleChildScrollView(
          // SingleChildScrollView allows scrolling if content exceeds the screen size
          child: Center(
            // Center widget centers its child vertically and horizontally
            child: Column(
              // Column arranges its children vertically
              mainAxisAlignment: MainAxisAlignment.center, // Vertically centers children
              crossAxisAlignment: CrossAxisAlignment.center, // Horizontally centers children
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
                SizedBox(height: 20), // Adds spacing between containers

                Container(
                  height: 200,
                  width: 200,
                  color: Colors.green,
                  child: Align(
                    // Align widget aligns its child within the container
                    alignment: Alignment.topLeft, // Aligns child content to the top left of the container
                    child: Text(
                      'Top Left Alignment',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Adds spacing between containers

                Container(
                  height: 200,
                  width: 200,
                  color: Colors.orange,
                  child: Align(
                    // Align widget aligns its child within the container
                    alignment: Alignment.bottomRight, // Aligns child content to the bottom right of the container
                    child: Text(
                      'Bottom Right Alignment',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Adds spacing between containers

                Container(
                  height: 200,
                  width: 200,
                  color: Colors.purple,
                  child: Stack(
                    // Stack widget allows children to be overlaid on top of each other
                    children: [
                      Positioned(
                        // Positioned widget positions its child relative to the stack
                        left: 20,
                        top: 20,
                        child: Text(
                          'Stacked Text 1',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      Positioned(
                        // Positioned widget positions its child relative to the stack
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
          ),
        ),
      ),
    );
  }
}
