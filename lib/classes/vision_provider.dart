import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googleapis/vision/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:rookiehacks/classes/credentials_provider.dart';

class VisionProvider {
  var _client = CredentialsProvider().getClient();

  Future<String> search(String image) async {
    var _vision = VisionApi(await _client);
    var _api = _vision.images;
    var _response = await _api.annotate(BatchAnnotateImagesRequest.fromJson({
      "requests": [
        {
          "image": {
            "content": image,
          },
          "features": [
            {
              "type": "DOCUMENT_TEXT_DETECTION",
            }
          ]
        }
      ]
    }));

    String detectedText = "";

    _response.responses.forEach((data) {
      print("*****************");
      detectedText = data.fullTextAnnotation.text;
      print("*****************");
    });

    return detectedText;
  }
}
