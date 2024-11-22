import 'dart:io';

import 'package:flutter/material.dart';


Future<File?> uriToFile(Uri? uri) async {
  if (uri == null) {
    return null;
  }
  try {
    return File.fromUri(uri);
  } catch (e) {
    debugPrint('Error converting URI to File: $e');
    return null;
  }
}
