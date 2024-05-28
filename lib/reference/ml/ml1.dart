import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  void initializeCamera() async {
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    await controller.initialize();
    if (!mounted) return;
    setState(() {
      isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> classifyImage() async {
    if (!controller.value.isTakingPicture) {
      XFile? imageFile;
      try {
        imageFile = await controller.takePicture();
      } catch (e) {
        print("Error taking picture: $e");
        return;
      }

      if (imageFile != null) {
        // Load image bytes
        Uint8List bytes = await imageFile.readAsBytes();

        // Classify image
        var result = await Tflite.runModelOnBinary(
          binary: bytes, // required
          numResults: 5, // Number of results to show
          threshold: 0.05, // Confidence threshold
          asynch: true,
        );

        // Process results
        if (result != null && result.isNotEmpty) {
          print("Classification result: $result");
          // Display results or perform further actions
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraInitialized) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: CameraPreview(controller),
      floatingActionButton: FloatingActionButton(
        onPressed: classifyImage,
        child: Icon(Icons.camera),
      ),
    );
  }
}
