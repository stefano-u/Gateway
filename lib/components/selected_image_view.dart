//import 'dart:convert';
//import 'dart:io';
//import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:googleapis/vision/v1.dart';
//import 'package:http/http.dart' as http;
//import 'package:rookiehacks/classes/vision_provider.dart';
//
//import 'data_storage.dart';
//
//// [SelectedImageView] widget displays the picture taken by the user
//class SelectedImageView extends StatelessWidget {
//  final String imagePath; // Absolute path of the image
//  String _token;
//  WebLabel _webLabel;
//
//  // Constructor
//  SelectedImageView({this.imagePath});
//
//  // User interface of the widget
//  @override
//  Widget build(BuildContext context) {
////    final dataContainer = UserDataContainer.of(context);
////    _webLabel = dataContainer.webLabel;
//
//    return Scaffold(
//      appBar: AppBar(
//          ),
//      body: Center(
//        // The image is stored as a file on the device. Use the `Image.file` constructor with the given path to display the image.
//        child: Image.file(
//          File(imagePath),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        child: new Icon(Icons.send),
//        backgroundColor: Colors.amber,
//        splashColor: Colors.transparent,
//        onPressed: () {
//          processImage(context, imagePath);
//        },
//      ),
//    );
//  }
//
////  void processImage(BuildContext context, String filePath) async {
////    List<int> imageBytes = File(imagePath).readAsBytesSync();
////    String base64Image = base64Encode(imageBytes);
////
////    VisionProvider vs = new VisionProvider();
////    _webLabel = await vs.search(base64Image);
////  }
//
//}
