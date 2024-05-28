import 'dart:ui'; // Importing dart:ui for Offset and Canvas
import 'package:flutter/material.dart';

void main() {
  runApp(MyDrawingApp()); // Entry point of the application
}

class MyDrawingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Drawing App'), // Title of the app bar
        ),
        body: DrawingBoard(), // Main body of the app, DrawingBoard widget
      ),
    );
  }
}

class DrawingBoard extends StatefulWidget {
  @override
  _DrawingBoardState createState() => _DrawingBoardState(); // Creates state for DrawingBoard
}

class _DrawingBoardState extends State<DrawingBoard> {
  List<DrawingPath> paths = []; // List to store drawing paths
  Color selectedColor = Colors.black; // Currently selected drawing color
  double strokeWidth = 2.0; // Currently selected stroke width

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            // Gesture detector to handle drawing gestures
            onPanUpdate: (details) {
              setState(() {
                RenderBox renderBox = context.findRenderObject() as RenderBox;
                // Add current touch position to the last path in the list
                paths.last.points.add(
                  renderBox.globalToLocal(details.globalPosition),
                );
              });
            },
            onPanStart: (details) {
              setState(() {
                // Create a new DrawingPath when drawing starts
                paths.add(
                  DrawingPath(
                    color: selectedColor,
                    strokeWidth: strokeWidth,
                    points: [details.localPosition],
                  ),
                );
              });
            },
            onPanEnd: (details) {
              setState(() {
                // Finalize the current path when drawing ends
                paths.last.finish();
              });
            },
            child: CustomPaint(
              painter: DrawingPainter(paths), // Custom painter to draw paths
              child: Container(), // Empty container to fill the area
            ),
          ),
        ),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              // Color buttons for selecting drawing color
              ColorButton(Colors.black, onSelectColor: selectColor),
              ColorButton(Colors.red, onSelectColor: selectColor),
              ColorButton(Colors.green, onSelectColor: selectColor),
              ColorButton(Colors.blue, onSelectColor: selectColor),
              SizedBox(width: 20),
              // Stroke width buttons for selecting stroke width
              StrokeWidthButton(2.0, onSetStrokeWidth: setStrokeWidth),
              StrokeWidthButton(4.0, onSetStrokeWidth: setStrokeWidth),
              StrokeWidthButton(6.0, onSetStrokeWidth: setStrokeWidth),
              StrokeWidthButton(8.0, onSetStrokeWidth: setStrokeWidth),
            ],
          ),
        ),
      ],
    );
  }

  // Method to update the selected color
  void selectColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  // Method to update the selected stroke width
  void setStrokeWidth(double width) {
    setState(() {
      strokeWidth = width;
    });
  }
}

class DrawingPath {
  List<Offset> points; // List of points in the path
  Color color; // Color of the path
  double strokeWidth; // Stroke width of the path

  DrawingPath({required this.points, required this.color, required this.strokeWidth}); // Constructor

  void finish() {
    // Additional logic can be added here in future implementations
  }
}

class DrawingPainter extends CustomPainter {
  final List<DrawingPath> paths; // List of drawing paths

  DrawingPainter(this.paths); // Constructor

  @override
  void paint(Canvas canvas, Size size) {
    for (var path in paths) {
      Paint paint = Paint()
        ..color = path.color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = path.strokeWidth;

      // Draw lines between all points in the path
      for (int i = 0; i < path.points.length - 1; i++) {
        if (path.points[i] != null && path.points[i + 1] != null) {
          canvas.drawLine(path.points[i], path.points[i + 1], paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true; // Always repaint to update drawing
}

class ColorButton extends StatelessWidget {
  final Color color; // Color of the button
  final Function(Color) onSelectColor; // Callback function when color is selected

  ColorButton(this.color, {required this.onSelectColor}); // Constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectColor(color); // Call the onSelectColor function with this button's color
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        margin: EdgeInsets.all(10),
      ),
    );
  }
}

class StrokeWidthButton extends StatelessWidget {
  final double width; // Width of the button
  final Function(double) onSetStrokeWidth; // Callback function when stroke width is set

  StrokeWidthButton(this.width, {required this.onSetStrokeWidth}); // Constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSetStrokeWidth(width); // Call the onSetStrokeWidth function with this button's width
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            width.toInt().toString(), // Display the width as text
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
