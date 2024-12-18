import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';

class CamraScreen extends StatefulWidget {
  const CamraScreen({super.key});

  @override
  State<CamraScreen> createState() => _CamraScreenState();
}

class _CamraScreenState extends State<CamraScreen> {
  CameraController? cameraController;
  List<CameraDescription> cameras = [];
  int selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _setupCamraController();
  }

  Future<void> _setupCamraController() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      setState(() {
        selectedCameraIndex = 0; // Default to the first camera
      });
      _initCameraController(cameras[selectedCameraIndex]);
    }
  }

  Future<void> _initCameraController(
      CameraDescription cameraDescription) async {
    cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
    );

    try {
      await cameraController!.initialize();
      setState(() {});
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  void _switchCamera() {
    selectedCameraIndex = (selectedCameraIndex + 1) % cameras.length;
    _initCameraController(cameras[selectedCameraIndex]);
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    bool isFrontCamera = cameraController!.description.lensDirection ==
        CameraLensDirection.front;

    return SafeArea(
      child: SizedBox.expand(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: isFrontCamera
                  ? Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(3.14159),
                      child: CameraPreview(cameraController!),
                    )
                  : CameraPreview(cameraController!),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 600, left: 80),
                  child: SizedBox(
                    width: 32,
                    child: const Icon(
                      Icons.photo_library_sharp,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    XFile picture = await cameraController!.takePicture();
                    Gal.putImage(picture.path);
                  },
                  icon: const Padding(
                    padding: EdgeInsets.only(top: 600, left: 20),
                    child: Icon(
                      Icons.circle_outlined,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 600),
                  child: IconButton(
                    icon: const Icon(
                      Icons.flip_camera_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: _switchCamera,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
