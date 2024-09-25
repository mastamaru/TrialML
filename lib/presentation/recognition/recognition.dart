import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];
String _emotion = '';
double _confidence = 0.0;

class Recognition extends StatefulWidget {
  const Recognition({Key? key}) : super(key: key);

  @override
  State<Recognition> createState() => _RecognitionState();
}

class _RecognitionState extends State<Recognition> {
  int _cameraIndex = 0;

  void _flipCamera() {
    setState(() {
      _cameraIndex = _cameraIndex == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 600,
              width: 450,
              color: Colors.grey,
              child: Camera(cameraIndex: _cameraIndex),
            ),
            SizedBox(height: 20),
            Text(
              'Your Expression: $_emotion with confidence: $_confidence',
              style: TextStyle(fontSize: 15),
            ),
            IconButton(
              onPressed: _flipCamera,
              icon: Icon(Icons.flip_camera_android, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class Camera extends StatefulWidget {
  final int cameraIndex;

  const Camera({Key? key, required this.cameraIndex}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  @override
  void didUpdateWidget(Camera oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.cameraIndex != oldWidget.cameraIndex) {
      initializeCamera();
    }
  }

  Future<void> initializeCamera() async {
    if (cameras.isEmpty) {
      cameras = await availableCameras();
    }
    final cameraIndex =
        widget.cameraIndex < cameras.length ? widget.cameraIndex : 0;
    controller =
        CameraController(cameras[cameraIndex], ResolutionPreset.medium);
    try {
      await controller!.initialize();
      if (!mounted) return;
      setState(() {});
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }
    return AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: CameraPreview(controller!),
    );
  }
}
