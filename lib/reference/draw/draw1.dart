import 'package:flutter/material.dart';

void main() {
  runApp(DrawingApp()); // Calls the DrawingApp widget to start the application
}

// StatefulWidget for the DrawingApp
class DrawingApp extends StatefulWidget {
  @override
  _DrawingAppState createState() => _DrawingAppState(); // Creates the mutable state for DrawingApp
}

// State class for DrawingApp
class _DrawingAppState extends State<DrawingApp> {
  List<TouchPoints?> points = []; // List to store points drawn on the canvas
  Color selectedColor = Colors.black; // Default color for drawing
  double strokeWidth = 4.0; // Default stroke width for drawing

  // Method to clear the canvas
  void clearCanvas() {
    setState(() {
      points.clear(); // Clear all points
    });
  }

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return MaterialApp(
      title: 'Drawing App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drawing App'), // Title of the app bar
          actions: [
            IconButton(
              icon: Icon(Icons.clear), // Icon for the clear button
              onPressed: clearCanvas, // Call clearCanvas when pressed
            ),
          ],
        ),
        body: GestureDetector(
          onPanUpdate: (details) {
            // Called when the pointer moves on the screen
            setState(() {
              // Add the current point to the list of points
              points.add(
                TouchPoints(
                  points: points.last?.points ?? [],
                  paint: Paint()
                    ..color = selectedColor
                    ..strokeWidth = strokeWidth
                    ..strokeCap = StrokeCap.round
                    ..isAntiAlias = true,
                ),
              );
              // Add the local position of the pointer to the points list
              points.last?.points.add(details.localPosition);
            });
          },
          onPanStart: (details) {
            // Called when the pointer starts to move on the screen
            setState(() {
              // Add a new TouchPoints object to start a new line
              points.add(
                TouchPoints(
                  points: [],
                  paint: Paint()
                    ..color = selectedColor
                    ..strokeWidth = strokeWidth
                    ..strokeCap = StrokeCap.round
                    ..isAntiAlias = true,
                ),
              );
            });
          },
          onPanEnd: (details) {
            // Called when the pointer stops moving on the screen
            setState(() {
              points.add(null); // Add a null entry to indicate the end of a line
            });
          },
          child: Container(
            color: Colors.white, // Background color of the drawing area
            child: CustomPaint(
              painter: DrawingPainter(points), // Custom painter for drawing
            ),
          ),
        ),
      ),
    );
  }
}

// Class to store touch points and paint properties
class TouchPoints {
  List<Offset?> points; // List of points in a line
  Paint paint; // Paint properties for the line

  TouchPoints({required this.points, required this.paint}); // Constructor
}

// Custom painter class for drawing on the canvas
class DrawingPainter extends CustomPainter {
  final List<TouchPoints?> points; // List of touch points

  DrawingPainter(this.points); // Constructor

  @override
  void paint(Canvas canvas, Size size) {
    // Method to paint on the canvas
    for (int i = 0; i < points.length; i++) {
      if (points[i] != null) {
        for (int j = 0; j < points[i]!.points.length - 1; j++) {
          if (points[i]!.points[j] != null && points[i]!.points[j + 1] != null) {
            // Draw line between consecutive points
            canvas.drawLine(
              points[i]!.points[j]!,
              points[i]!.points[j + 1]!,
              points[i]!.paint,
            );
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true; // Always repaint the canvas
}
