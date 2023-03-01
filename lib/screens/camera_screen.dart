import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// A screen that allows users to take a picture using a given camera.

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  // final CameraDescription camera;

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    await _controller.initialize();
    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    Future<void> _takePicture() async {
      if (!_controller.value.isInitialized) {
        return;
      }

      final image = await _controller.takePicture();

      // Do something with the image
    }

    void _toggleCamera() {
      final newCameraLensDirection =
          _controller.description.lensDirection == CameraLensDirection.front
              ? CameraLensDirection.back
              : CameraLensDirection.front;

      final newCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == newCameraLensDirection);

      _controller = CameraController(
        newCamera,
        ResolutionPreset.high,
      );

      _controller.initialize().then((_) {
        setState(() {});
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: CameraPreview(_controller),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: _takePicture,
              ),
              IconButton(
                icon: Icon(Icons.flip_camera_android),
                onPressed: _toggleCamera,
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
