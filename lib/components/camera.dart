import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:googleapis/cloudbuild/v1.dart';
import 'package:googleapis/vision/v1.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:rookiehacks/classes/vision_provider.dart';
import 'package:rookiehacks/components/selected_image_view.dart';
import 'dart:io' as Io;

import 'data_storage.dart';

// Source: https://flutter.dev/docs/cookbook/plugins/picture-using-camera#5-take-a-picture-with-the-cameracontroller
// [Camera] widget displays the camera and barcode scanner
class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  bool _isLoading = false;
  List<String> _listItemsToSave = [];
  UserDataContainerState _dataContainer;
  CameraDescription _camera; // Selected camera
  CameraController _controller; // Controller for the camera
  Future<void> _initializeControllerFuture; // Used for the FutureBuilder

  // Initializes the camera on widget load
  @override
  void initState() {
    super.initState();
    // Waits on the [loadCameras()] method to initialize [initializeControllerFuture]
    loadCameras().then((result) {
      setState(() {
        _controller = CameraController(_camera, ResolutionPreset.max);
        _initializeControllerFuture = _controller.initialize();
      });
    });
  }

  // Disposes the CameraController when this widget is no longer used
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  // Get a specific camera from the list of available cameras.
  Future<void> loadCameras() async {
    final cameras = await availableCameras();
    _camera = cameras.first;
  }

  // Takes a picture with the camera and opens the [DisplayPictureScreen] widget to show picture to user
  void onCameraButtonPressed(BuildContext context) async {
    try {
      _setLoadingIndicatorVisibility(true);


      // Construct the path where the image should be saved using the pattern package.
      final path = join(
        // Store the picture in the temp directory.
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

      // Attempt to take a picture
      await _controller.takePicture(path);

      processImage(context, path);

    } catch (e) {
      print(e);
    }
  }

  void processImage(BuildContext context, String filePath) async {
    Uint8List imageBytes = await File(filePath).readAsBytes();
    String base64Image = base64Encode(imageBytes);

    print(base64Image);

    VisionProvider vs = new VisionProvider();
    String data = await vs.search(base64Image);
    _dataContainer.updateMessages(data);

    _setLoadingIndicatorVisibility(false);

    Navigator.pop(context);
  }

  // Sets the visibility of the circular progress indicator (for loading)
  void _setLoadingIndicatorVisibility(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  // User interface of the widget
  @override
  Widget build(BuildContext context) {
    _dataContainer = UserDataContainer.of(context);

    return Scaffold(
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the Future is complete, display the preview.
              return CameraPreview(_controller);
            } else {
              // Otherwise, display a loading indicator.
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        children: <Widget>[
          // Camera button
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
                child: Icon(Icons.camera_alt),
//              backgroundColor: kPrimaryColorDark,
                onPressed: () {
                  onCameraButtonPressed(context);
                }),
          ),
        ],
      ),
    );
  }
}
