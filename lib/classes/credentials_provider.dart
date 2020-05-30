import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googleapis/vision/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

// Allows you to login to the Google APIs
// https://github.com/dart-lang/googleapis/issues/67#issuecomment-523011802
class CredentialsProvider {
  CredentialsProvider();

  Future<ServiceAccountCredentials> getCredentials() async {
    String file = await rootBundle.loadString('assets/RookieHacks2020-84e699848024.json');
    return ServiceAccountCredentials.fromJson(file);
  }

  Future<AutoRefreshingAuthClient> getClient() async {
    AutoRefreshingAuthClient _client = await clientViaServiceAccount(await getCredentials(), [VisionApi.CloudVisionScope]);
    return _client;
  }
}